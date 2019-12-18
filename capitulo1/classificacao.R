# O pacote caret exige que as features tenham nomes
colunas = c("perna_curta", "grodinho", "auau")

porco1 = c(1, 1, 0)
porco2 = c(1, 1, 0)
porco3 = c(1, 1, 0)
cachorro4 = c(1, 1, 1)
cachorro5 = c(0, 1, 1)
cachorro6 = c(0, 1, 1)

dados = rbind(porco1, porco2, porco3, cachorro4, cachorro5, cachorro6)
colnames(dados) = colunas

marcacoes = factor(c(1, 1, 1, - 1, - 1, - 1))

library(caret)

method = 'naive_bayes'
modelo = train(x = dados, y = marcacoes, method = method)

misterioso1 = c(1, 1, 1)
misterioso2 = c(1, 0, 0)
misterioso3 = c(0, 0, 1)

teste = rbind(misterioso1, misterioso2, misterioso3)
colnames(teste) = colunas

marcacoes_teste = factor(c(- 1, 1, 1))

resultado = predict(modelo, newdata = teste)

acertos = resultado == marcacoes_teste

total_de_acertos = sum(acertos)
total_de_elementos = nrow(teste)

taxa_de_acerto = 100.0 * total_de_acertos / total_de_elementos

print(resultado)
print(diferencas)
print(taxa_de_acerto)