-- Consulta tabelas do schema 'despesas'
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'despesas';

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'login_registros';

-- Seleciona o BD e retorna todos os schemas desse BD:
SELECT schema_name
FROM information_schema.schemata
WHERE schema_name NOT LIKE 'pg_%' AND schema_name != 'information_schema';
