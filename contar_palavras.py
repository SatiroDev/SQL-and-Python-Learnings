# contar quantas palavras tem em uma frase

def contar_palavras(frase):
    sinais = '"!{,.:'"'/;<=>?}#$%&-@[ \ ]^_{'{}'}{'|'}~"'*+-@'
    quantidade_palavras = 0
    for i in frase.split():
        if i not in sinais:
            quantidade_palavras += 1
    return f'Quantidade de palavras: {quantidade_palavras}'
frase = 'Olá, tudo bem?'
print(contar_palavras(frase))


# def contar_palavras(frase):
#     sinais = '"!{,.:'"'/;<=>?}#$%&-@[ \ ]^_`{'{}'}{'|'}~"'*+-@'
#     quantidade_palavras = 0
#     for i in frase.split():
#         if i not in sinais:
#             a = i.split()
#             for y in a[-1]:
#                 if y in sinais:
#                     pass
#             quantidade_palavras += 1
#     return f'Quantidade de palavras: {quantidade_palavras}'
# frase = 'Olá, tudo bem?'
# print(contar_palavras(frase))