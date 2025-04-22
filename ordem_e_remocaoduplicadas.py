def remover_duplicados(lista):
    lista_atualizada = []
    for i in lista:
        verificacao = False
        for y in lista_atualizada:
            if i.lower() == y.lower():
                verificacao = True
        if verificacao == False:
            lista_atualizada.append(i)
    return f'Lista atualizada, sem duplicados e em ordem alfabética: {sorted(lista_atualizada)}'

lista = ['José', 'Joao', 'R. Mácario Pontes', 'José', 'joao']
print(remover_duplicados(lista))

