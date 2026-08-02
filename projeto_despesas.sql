-- =========================================================
-- PROJETO: ANÁLISE DE DESPESAS PESSOAIS COM SQL
-- BANCO DE DADOS: MySQL 8.0
-- AUTOR: [Arthur Morais]
-- DATA: 2026
-- DESCRIÇÃO: Projeto para praticar CRUD e Funções de Agregação
-- =========================================================

-- 1. CRIAÇÃO DA ESTRUTURA DA TABELA
CREATE TABLE despesas_pessoais(
	id int auto_increment Primary Key,
	mes varchar(50) NOT NULL,
	comida decimal(5,2), -- valor inicial: será ajustado abaixo
	academia decimal(5,2),
	faculdade decimal(5,2),
    jogo decimal(5,2),
    assinaturas decimal(5,2),
	descricao varchar(200)
);

-- 2. POPULANDO A TABELA COM DADOS DOS 7 PRIMEIROS MESES
INSERT INTO despesas_pessoais
(mes, comida, academia, faculdade, jogo, assinaturas, descricao)
VALUES
('Janeiro', 280.50, 99.90, 871.00, 120.00, 156.00, 'Gastos do mês de janeiro'),
('Fevereiro', 295.80, 99.90, 871.00, 80.00, 156.00, 'Gastos do mês de fevereiro'),
('Março', 310.20, 99.90, 871.00, 150.00, 156.00, 'Gastos do mês de março'),
('Abril', 275.40, 99.90, 871.00, 60.00, 156.00, 'Gastos do mês de abril'),
('Maio', 325.70, 99.90, 871.00, 90.00, 156.00, 'Gastos do mês de maio'),
('Junho', 290.30, 99.90, 871.00, 130.00, 156.00, 'Gastos do mês de junho'),
('Julho', 305.60, 99.90, 871.00, 100.00, 156.00, 'Gastos do mês de julho');

-- 3. AJUSTE DE ESTRUTURA
-- Motivo: decimal(5,2) limita a 999.99. Ajustado para 10,2 para suportar valores maiores
ALTER TABLE despesas_pessoais 
MODIFY COLUMN comida decimal(10,2),
MODIFY COLUMN academia decimal(10,2),
MODIFY COLUMN faculdade decimal(10,2),
MODIFY COLUMN jogo decimal(10,2),
MODIFY COLUMN assinaturas decimal(10,2);

-- 4. ANÁLISES E CONSULTAS

-- 4.1 Listar todos os registros da tabela
SELECT * FROM despesas_pessoais;

-- 4.2 Total gasto por mês em ordem decrescente
SELECT mes,
	ROUND((comida + academia + faculdade + jogo + assinaturas), 2) AS total_gasto
FROM despesas_pessoais
ORDER BY total_gasto DESC; 

-- 4.3 Top 3 meses com maior gasto
SELECT mes,
	ROUND((comida + academia + faculdade + jogo + assinaturas), 2) AS total_gasto
FROM despesas_pessoais
ORDER BY total_gasto DESC
LIMIT 3;

-- 4.4 Média de gastos mensais no período
SELECT ROUND(AVG(comida + academia + faculdade + jogo + assinaturas), 2) AS media_gasto_mensal
FROM despesas_pessoais;

-- 4.5 Maior gasto registrado por categoria usando MAX
SELECT 
    MAX(comida) AS maior_gasto_comida,
    MAX(jogo) AS maior_gasto_lazer
FROM despesas_pessoais;

-- 4.6 Menor gasto registrado por categoria usando MIN
SELECT 
    MIN(comida) AS menor_gasto_comida,
    MIN(jogo) AS menor_gasto_lazer
FROM despesas_pessoais;

-- 4.7 Mês com o maior gasto total
SELECT mes,
	ROUND((comida + academia + faculdade + jogo + assinaturas), 2) AS total_gasto
FROM despesas_pessoais
ORDER BY total_gasto DESC
LIMIT 1;

-- 4.8 Mês com o menor gasto total
SELECT mes,
	ROUND((comida + academia + faculdade + jogo + assinaturas), 2) AS total_gasto
FROM despesas_pessoais
ORDER BY total_gasto ASC
LIMIT 1;


SELECT mes,
	ROUND(SUM(comida + academia + faculdade + jogo + assinaturas)) AS total_gasto
	from despesas_pessoais
	GROUP BY mes
	HAVING total_gasto > 1400
	ORDER BY total_gasto DESC;
