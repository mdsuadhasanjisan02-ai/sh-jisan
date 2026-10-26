-- Run in Supabase SQL Editor. Every row is scoped to the signed-in owner.
create table if not exists public.student_data (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  kind text not null,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
alter table public.student_data enable row level security;
create policy "Users can read own data" on public.student_data for select using (auth.uid() = user_id);
create policy "Users can insert own data" on public.student_data for insert with check (auth.uid() = user_id);
create policy "Users can update own data" on public.student_data for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Users can delete own data" on public.student_data for delete using (auth.uid() = user_id);

insert into storage.buckets (id, name, public, file_size_limit)
values ('student-files', 'student-files', false, 20971520)
on conflict (id) do nothing;
create policy "Users manage own student files" on storage.objects
for all to authenticated
using (bucket_id = 'student-files' and (storage.foldername(name))[1] = auth.uid()::text)
with check (bucket_id = 'student-files' and (storage.foldername(name))[1] = auth.uid()::text);
