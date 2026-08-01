import pandas as pd 

# ------------------------------------------------------------------------------
# 1. CARREGAMENTO DOS DADOS
# ------------------------------------------------------------------------------
# Importa a base de dados em formato CSV para o DataFrame do Pandas

df = pd.read_csv("projeto_despesas.csv")

# ------------------------------------------------------------------------------
# 2. ADICIONANDO O TOTAL GASTO
# ------------------------------------------------------------------------------
# Consolida todas as categorias de despesas individuais em um indicador total

df['total_gasto'] = df['comida'] + df['academia'] + df['faculdade'] + df['jogo'] + df['assinaturas']
print(df)

# ------------------------------------------------------------------------------
# 3. MÉDIA DE GASTOS
# ------------------------------------------------------------------------------
# Calcula a média dos gastos totais registrados.

media_gastos = df['total_gasto'].mean()
print(f'\n Gasto Médio: R${media_gastos:.2f}')


# ------------------------------------------------------------------------------
# 4. MAIOR GASTO
# ------------------------------------------------------------------------------
# Identifica o maior gasto total entre todos os meses.

maior_gasto_mes = df ['total_gasto'].max()
print(f'\n O maior gasto registrado foi: R${maior_gasto_mes:.2f}')

# ------------------------------------------------------------------------------
# 5. MENOR GASTO
# ------------------------------------------------------------------------------
# Identifica o menor gasto total entre todos os meses.

menor_gasto_mes = df['total_gasto'].min()
print(f'\n O menor gasto registrado foi R${menor_gasto_mes:.2f}')
