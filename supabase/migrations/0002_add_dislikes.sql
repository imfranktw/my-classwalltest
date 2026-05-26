-- 0002_add_dislikes.sql
-- 新增 dislikes 表，前端可透過 INSERT 新增一筆 dislike

create table if not exists public.dislikes (
  id uuid primary key default gen_random_uuid(),
  question_id uuid not null references public.questions (id) on delete cascade,
  created_at timestamptz not null default now()
);

create index if not exists dislikes_question_id_idx
  on public.dislikes (question_id);

-- Realtime publication
alter publication supabase_realtime add table public.dislikes;

-- RLS：匿名使用者可讀、可新增 dislike
alter table public.dislikes enable row level security;

drop policy if exists "anyone can read dislikes" on public.dislikes;
create policy "anyone can read dislikes"
  on public.dislikes for select
  using (true);

drop policy if exists "anyone can insert dislikes" on public.dislikes;
create policy "anyone can insert dislikes"
  on public.dislikes for insert
  with check (true);
