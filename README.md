# 📊 Projeto: Análise de Despesas Pessoais

Projeto de banco de dados em **MySQL** e análise de dados com **Python (Pandas)** para controle e monitoramento de despesas mensais.

---

## 📝 Sobre o Projeto

Este projeto simula uma estrutura para acompanhamento de despesas pessoais, abrangendo gastos fixos e variáveis ao longo do ano.

O objetivo é praticar conceitos de:

- Modelagem de banco de dados relacional;
- Manipulação de dados com DDL e DML;
- Consultas analíticas utilizando SQL;
- Exportação de dados para CSV;
- Análise de dados com Python e Pandas.

---

## 🛠 Tecnologias Utilizadas

- MySQL
- SQL
- Python 3
- Pandas
- CSV

---

## 🎯 Objetivos de Aprendizagem

- Criar e estruturar tabelas em MySQL;
- Inserir e manipular dados utilizando SQL;
- Utilizar funções de agregação (`SUM`, `AVG`, `MAX` e `MIN`);
- Aplicar consultas com `ORDER BY`, `GROUP BY`, `HAVING` e `LIMIT`;
- Exportar dados para CSV;
- Realizar análises utilizando a biblioteca Pandas.

---

## 📁 Arquivos do Repositório

- `despesas.sql` → Script para criação da tabela, inserção de dados e consultas SQL.
- `despesas.csv` → Base de dados utilizada na análise.
- `analise_despesas.py` → Script em Python responsável pelo cálculo de indicadores utilizando Pandas.

---

## 🗃️ Estrutura da Tabela `despesas_pessoais`

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| `id` | `INT` | Identificador único (AUTO_INCREMENT) |
| `mes` | `VARCHAR(50)` | Mês correspondente |
| `comida` | `DECIMAL(10,2)` | Gastos com alimentação |
| `academia` | `DECIMAL(10,2)` | Gastos com academia |
| `faculdade` | `DECIMAL(10,2)` | Mensalidade da faculdade |
| `jogo` | `DECIMAL(10,2)` | Gastos com jogos e lazer |
| `assinaturas` | `DECIMAL(10,2)` | Gastos com serviços de assinatura |
| `descricao` | `VARCHAR(200)` | Observações do mês |

---

## 🚀 Como Executar

### 1. Banco de Dados (MySQL)

1. Abra o **MySQL Workbench** (ou outro cliente MySQL).
2. Execute o arquivo `despesas.sql`.
3. O script criará a tabela e inserirá os registros.

### 2. Python

Instale a biblioteca Pandas:

```bash
pip install pandas
```

Execute o script:

```bash
python analise_despesas.py
```

---

## 📈 Exemplos de Consultas SQL

### Total gasto por mês

=´=```sql
SELECT mes,
       ROUND((comida + academia + faculdade + jogo + assinaturas), 2) AS total_gasto
FROM despesas_pessoais
ORDER BY total_gasto DESC;
```

### Top 3 meses com maior gasto

```sql
SELECT mes,
       ROUND((comida + academia + faculdade + jogo + assinaturas), 2) AS total_gasto
FROM despesas_pessoais
ORDER BY total_gasto DESC
LIMIT 3;
```

### Média de gasto mensal

```sql
SELECT ROUND(AVG(comida + academia + faculdade + jogo + assinaturas), 2) AS media_total
FROM despesas_pessoais;
```

### Meses com gasto acima de R$ 1.400,00

```sql
SELECT mes,
       ROUND(SUM(comida + academia + faculdade + jogo + assinaturas), 2) AS total_gasto
FROM despesas_pessoais
GROUP BY mes
HAVING total_gasto > 1400
ORDER BY total_gasto DESC;
```

---

## 🐍 Análise de Dados com Python

```python
import pandas as pd

# Carregar os dados
df = pd.read_csv("despesas.csv")

# Criar coluna com o total gasto por mês
df["total_gasto"] = (
    df["comida"] +
    df["academia"] +
    df["faculdade"] +
    df["jogo"] +
    df["assinaturas"]
)

# Indicadores
media_gastos = df["total_gasto"].mean()
maior_gasto = df["total_gasto"].max()
menor_gasto = df["total_gasto"].min()

print(f"Gasto Médio: R$ {media_gastos:.2f}")
print(f"Maior Gasto: R$ {maior_gasto:.2f}")
print(f"Menor Gasto: R$ {menor_gasto:.2f}")
```

---

## 📊 Exemplo de Saída

```text
Gasto Médio: R$ 1364.17
Maior Gasto: R$ 1528.00
Menor Gasto: R$ 1237.00
```

---

## 📌 Próximas Melhorias

- Desenvolver um dashboard no Power BI.
- Criar gráficos utilizando Pandas.
- Adicionar novas categorias de despesas.
- Implementar filtros e análises por categoria.

---

## 👨‍💻 Autor

Desenvolvido por **Arthur Morais**.