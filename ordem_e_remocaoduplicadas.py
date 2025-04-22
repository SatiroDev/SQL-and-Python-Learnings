def remover_duplicados(lista):
    lista_atualizada = []
    for i in lista:
        if i.lower() not in lista_atualizada:
            lista_atualizada.append(i.lower())
    return f'Lista atulizada, sem duplicados e em ordem alfabética: {sorted(lista_atualizada)}'

lista = ['José', 'Joao', 'R. Mácario Pontes', 'José', 'joao']
print(remover_duplicados(lista))

