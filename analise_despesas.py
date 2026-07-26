import pandas as pd 

df = pd.read_csv("projeto_despesas.csv")

#1. Criando Nova Coluna: Total_Gastos

df['total_gasto'] = df['comida'] + df['academia'] + df['faculdade'] + df['jogo'] + df['assinaturas']
print(df)