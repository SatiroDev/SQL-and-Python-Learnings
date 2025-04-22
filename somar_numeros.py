lista = [1,2, 5, 66, 'oi9', 'oi', 0, '0o']
somente_numeros = []
for i in lista:
    verificacao = str(i).isnumeric()
    if verificacao == True:
        somente_numeros.append(i)
soma_numeros = sum(somente_numeros)
print(f'A soma dos números que estavam na lista é: {soma_numeros}')