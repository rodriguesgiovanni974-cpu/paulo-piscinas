-- Paulo Piscina — Migração Supabase
-- Cole no SQL Editor do Supabase e execute

create table if not exists clientes (
  id bigserial primary key,
  nome text not null,
  telefone text,
  endereco text,
  mensalidade numeric default 0,
  frequencia text default 'Quinzenal',
  dia text default 'Segunda',
  obs text,
  status text default 'ativo',
  ultimo_atendimento date,
  created_at timestamptz default now()
);

create table if not exists lancamentos (
  id bigserial primary key,
  data date not null,
  descricao text not null,
  categoria text,
  tipo text not null,
  valor numeric not null default 0,
  created_at timestamptz default now()
);

create table if not exists orcamentos (
  id bigserial primary key,
  num text,
  cliente text,
  data date,
  total numeric default 0,
  created_at timestamptz default now()
);

create table if not exists gastos_recorrentes (
  id bigserial primary key,
  descricao text not null,
  categoria text default 'Outros',
  valor numeric not null default 0,
  ativo boolean default true,
  created_at timestamptz default now()
);

-- Desabilita RLS (sem autenticação por enquanto)
alter table clientes disable row level security;
alter table lancamentos disable row level security;
alter table orcamentos disable row level security;
alter table gastos_recorrentes disable row level security;
