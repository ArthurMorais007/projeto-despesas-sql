# Projeto: Análise de Despesas Pessoais

Projeto de banco de dados em MySQL para controle de gastos mensais.

## Sobre o Projeto
Esse projeto simula uma tabela de despesas pessoais com os gastos fixos e variáveis do mês.
O objetivo é praticar SQL, GROUP BY, SUM e exportação de dados.

## 📁Arquivos do Repositório
- `despesas.sql` → Script para criar a tabela no MySQL
- `despesas.csv` → Dados da tabela prontos pra usar no Excel/Power BI

## 🗃️ Estrutura da Tabela `despesas_pessoais`
| Coluna | Tipo | Descrição |
| --- | --- | --- |
| mes | VARCHAR | Mês da despesa |
| comida | DECIMAL | Gasto com comida |
| academia | DECIMAL | Mensalidade academia |
| faculdade | DECIMAL | Mensalidade faculdade |
| jogo | DECIMAL | Gastos com jogos |
| assinaturas | DECIMAL | Netflix, Spotify, etc |

## 🚀 Como usar
1. Abra o MySQL Workbench
2. Execute o arquivo `despesas.sql` para criar a tabela
3. Importe o arquivo `despesas.csv` com os dados

## 📈 Exemplo de Consulta
```sql
-- Total gasto por mês
-- 1. Total gasto por mês
SELECT mes,
       ROUND((comida + academia + faculdade + jogo + assinaturas), 2) AS total_gasto
FROM despesas_pessoais
ORDER BY total_gasto DESC;

-- 2. Top 3 meses mais caros
SELECT mes,
       ROUND((comida + academia + faculdade + jogo + assinaturas), 2) AS total_gasto
FROM despesas_pessoais
ORDER BY total_gasto DESC
LIMIT 3;

-- 3. Média de gasto total
SELECT ROUND(AVG(comida + academia + faculdade + jogo + assinaturas), 2) AS media_Total
FROM despesas_pessoais;