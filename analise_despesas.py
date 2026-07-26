import pandas as pd 

df = pd.read_csv("projeto_despesas.csv")

#1. Criando Nova Coluna: Total_Gastos

df['total_gasto'] = df['comida'] + df['academia'] + df['faculdade'] + df['jogo'] + df['assinaturas']
print(df)

#2 Média de Gastos por mês

media_gastos = df['total_gasto'].mean()
print(f'\n O valor médio de Gastos é: R${media_gastos:.2f}')