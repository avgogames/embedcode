-- 3D Sudoku (embed/sudoku.js): players pick a username and a PIN, can save one game and keep their best times.
-- Run once in Supabase: Dashboard > SQL Editor > New query > paste > Run.
-- PINs are stored only as bcrypt hashes. The tables have no policies, so the browser can reach them only
-- through the functions below, which check the PIN every time and lock a name for 10 minutes after 5 wrong PINs.

create extension if not exists pgcrypto with schema extensions;

create table if not exists public.sudoku_users (
  id bigint generated always as identity primary key,
  name text not null,
  pin_hash text not null,
  fails int not null default 0,
  locked_until timestamptz,
  created_at timestamptz not null default now()
);
create unique index if not exists sudoku_users_name on public.sudoku_users (lower(name));

create table if not exists public.sudoku_saves (
  user_id bigint primary key references public.sudoku_users(id) on delete cascade,
  state jsonb not null,
  updated_at timestamptz not null default now()
);

create table if not exists public.sudoku_times (
  id bigint generated always as identity primary key,
  user_id bigint not null references public.sudoku_users(id) on delete cascade,
  diff text not null check (diff in ('easy','medium','hard')),
  seconds int not null check (seconds between 20 and 86400),
  at timestamptz not null default now()
);

alter table public.sudoku_users enable row level security;
alter table public.sudoku_saves enable row level security;
alter table public.sudoku_times enable row level security;
revoke all on public.sudoku_users, public.sudoku_saves, public.sudoku_times from anon, authenticated;

-- checks name + PIN, returns the user id; creates the user when p_create is true and the name is free
create or replace function public._sudoku_auth(p_name text, p_pin text, p_create boolean)
returns bigint language plpgsql security definer set search_path = public, extensions as $$
declare u public.sudoku_users;
begin
  if p_name !~ '^[A-Za-z0-9_]{3,20}$' then raise exception 'Username must be 3-20 letters, numbers or _'; end if;
  if p_pin !~ '^[0-9]{4,6}$' then raise exception 'PIN must be 4-6 digits'; end if;
  select * into u from public.sudoku_users where lower(name) = lower(p_name);
  if not found then
    if not p_create then raise exception 'Unknown username'; end if;
    insert into public.sudoku_users (name, pin_hash) values (p_name, crypt(p_pin, gen_salt('bf'))) returning * into u;
    return u.id;
  end if;
  if u.locked_until is not null and u.locked_until > now() then raise exception 'Too many wrong PINs. Try again in 10 minutes'; end if;
  if u.pin_hash <> crypt(p_pin, u.pin_hash) then
    update public.sudoku_users set fails = fails + 1,
      locked_until = case when fails + 1 >= 5 then now() + interval '10 minutes' else null end where id = u.id;
    raise exception 'Wrong PIN';
  end if;
  if u.fails > 0 then update public.sudoku_users set fails = 0, locked_until = null where id = u.id; end if;
  return u.id;
end $$;
revoke all on function public._sudoku_auth(text, text, boolean) from public, anon, authenticated;

-- sign in (or register a new name); returns {name, is_new, save, best:{easy,medium,hard}}
create or replace function public.sudoku_login(p_name text, p_pin text)
returns jsonb language plpgsql security definer set search_path = public, extensions as $$
declare uid bigint; existed boolean;
begin
  existed := exists (select 1 from public.sudoku_users where lower(name) = lower(p_name));
  uid := public._sudoku_auth(p_name, p_pin, true);
  return jsonb_build_object(
    'name', (select name from public.sudoku_users where id = uid),
    'is_new', not existed,
    'save', (select state from public.sudoku_saves where user_id = uid),
    'best', (select coalesce(jsonb_object_agg(diff, m), '{}'::jsonb) from (select diff, min(seconds) m from public.sudoku_times where user_id = uid group by diff) t));
end $$;

create or replace function public.sudoku_save(p_name text, p_pin text, p_state jsonb)
returns void language plpgsql security definer set search_path = public, extensions as $$
declare uid bigint;
begin
  uid := public._sudoku_auth(p_name, p_pin, false);
  if octet_length(p_state::text) > 4000 then raise exception 'Save too large'; end if;
  insert into public.sudoku_saves (user_id, state, updated_at) values (uid, p_state, now())
    on conflict (user_id) do update set state = excluded.state, updated_at = now();
end $$;

-- records a finished game, clears the save, returns the best time for that level
create or replace function public.sudoku_finish(p_name text, p_pin text, p_diff text, p_seconds int)
returns int language plpgsql security definer set search_path = public, extensions as $$
declare uid bigint;
begin
  uid := public._sudoku_auth(p_name, p_pin, false);
  insert into public.sudoku_times (user_id, diff, seconds) values (uid, p_diff, p_seconds);
  delete from public.sudoku_saves where user_id = uid;
  return (select min(seconds) from public.sudoku_times where user_id = uid and diff = p_diff);
end $$;

grant execute on function public.sudoku_login(text, text), public.sudoku_save(text, text, jsonb),
  public.sudoku_finish(text, text, text, int) to anon, authenticated;
