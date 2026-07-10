CREATE TABLE despesas_pessoais(
	id int auto_increment Primary Key,
	mes varchar (50),
	comida decimal (5,2),
	academia decimal (5,2),
	faculdade decimal (5,2),
    jogo decimal (5,2),
    assinaturas decimal (5,2),
	descricao varchar (200)
);

INSERT INTO despesas_pessoais
(mes, comida, academia, faculdade, jogo, assinaturas, descricao)
VALUES
('Janeiro', 280.50, 99.90, 871.00, 120.00, 156.00, 'Gastos do mês de janeiro'),
('Fevereiro', 295.80, 99.90, 871.00, 80.00, 156.00, 'Gastos do mês de fevereiro'),
('Março', 310.20, 99.90, 871.00, 150.00, 156.00, 'Gastos do mês de março'),
('Abril', 275.40, 99.90, 871.00, 60.00, 156.00, 'Gastos do mês de abril'),
('Maio', 325.70, 99.90, 871.00, 90.00,  156.00, 'Gastos do mês de maio'),
('Junho', 290.30, 99.90, 871.00, 130.00, 156.00, 'Gastos do mês de junho'),
('Julho', 305.60, 99.90, 871.00, 100.00, 156.00, 'Gastos do mês de julho');

SELECT * FROM despesas_pessoais;

SELECT mes,
	ROUND((comida + academia + faculdade + jogo + assinaturas),2) AS Total
FROM despesas_pessoais
ORDER BY total DESC; 

SELECT mes,
	ROUND((comida + academia + faculdade + jogo + assinaturas),2) AS Total
FROM despesas_pessoais
ORDER BY total DESC
LIMIT 3;

SELECT ROUND(AVG(comida + academia + faculdade + jogo + assinaturas), 2) AS media_Total
FROM despesas_pessoais;