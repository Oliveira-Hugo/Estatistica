using Plots, Distributions, StatsBase, StatsPlots, DelimitedFiles, Random

#= 
Questão 1, b:

Utilize o R (ou outro programa) para ler cada arquivo e calcule estimativas para a
média e a variância do conjunto de dados (usando todos os dados disponíveis nos
arquivos). Em seguida, compare com os resultados obtidos no exercício anterior.
Faça comentários.
=#

if !isfile("data1q.dat") || !isfile("data1t.dat") || !isfile("data1x.dat") || !isfile("data1y.dat")
    error("Erro na leitura de arquivo")
end

data_q = Float64[]
data_t = Float64[]
data_x = Float64[]
data_y = Float64[]

open("data1q.dat", "r") do file
    for line in eachline(file)
        push!(data_q, parse(Float64, line))
    end
end

open("data1t.dat", "r") do file
    for line in eachline(file)
        push!(data_t, parse(Float64, line))
    end
end

open("data1x.dat", "r") do file
    for line in eachline(file)
        push!(data_x, parse(Float64, line))
    end
end

open("data1y.dat", "r") do file
    for line in eachline(file)
        push!(data_y, parse(Float64, line))
    end
end

var_q = var(data_q)
var_t = var(data_t)
var_x = var(data_x)
var_y = var(data_y)

media_q = mean(data_q)
media_t = mean(data_t)
media_x = mean(data_x)
media_y = mean(data_y)

println("Média de q: $media_q, Variância de q: $var_q")
println("Média de t: $media_t, Variância de t: $var_t")
println("Média de x: $media_x, Variância de x: $var_x")
println("Média de y: $media_y, Variância de y: $var_y")

#=
Questão 1, c:

Construa os histogramas com as frequências relativas de cada uma das variáveis,
verificando se estes são condizentes com os modelos teóricos (Tabela 1).
=#

p1 = histogram(data_q, bins = 80, normalize=:pdf, title = "Histograma da variável Q", label = "Q", xlims=(minimum(data_q), 20))
p2 = histogram(data_t, bins = 40, normalize=:pdf, title = "Histograma da variável T", label = "T", xlims=(minimum(data_t), 20))
p3 = histogram(data_x, bins = 40, normalize=:pdf, title = "Histograma da variável X", label = "X", xlims=(minimum(data_x), 20))
p4 = histogram(data_y, bins = 80, normalize=:pdf, title = "Histograma da variável Y", label = "Y", xlims=(minimum(data_y), 20))

plot(p1, p2, p3, p4, layout = (2, 2))

#= 
Questão 1, d:

Considere cada uma das amostras das variáveis aleatórias, contidas nos arquivos,
e suas diferentes distribuições de probabilidades. Tome amostras aleatórias de
tamanho n (n = 5, 10 e 50) de cada uma das variáveis aleatórias e construa as
variáveis aleatórias (estatísticas):
[...]
onde W = Q, X, Y ou T. Use 10000 amostras simples (pontos amostrais) para gerar
as variáveis aleatórias média amostral e variância amostral. Obs.: Lembre-se das
características que as amostras aleatórias devem ter. Apresente o código.
=#

medias_q = []
vars_q = []
medias_t = []
vars_t = []
medias_x = []
vars_x = []
medias_y = []
vars_y = []

function estatisticas_amostrais(data, n)
    amostra = rand(data, n)
    return mean(amostra), var(amostra)
end

for n in [5, 10, 50, 10000]
    media, variancia = estatisticas_amostrais(data_q, n)        #Esse 10000 deve ser contido em uma imagem separada, e utilizado no exercicio a seguir
    push!(medias_q, media)
    push!(vars_q, variancia)
    #println("Variável Q. Tamanho amostral: $n, Média: $media, Variância: $variancia")
end

for n in [5, 10, 50, 10000]
    media, variancia = estatisticas_amostrais(data_t, n)
    push!(medias_t, media)
    push!(vars_t, variancia)
    #println("Variável T. Tamanho amostral: $n, Média: $media, Variância: $variancia")
end

for n in [5, 10, 50, 10000]
    media, variancia = estatisticas_amostrais(data_x, n)
    push!(medias_x, media)
    push!(vars_x, variancia)
    #println("Variável X. Tamanho amostral: $n, Média: $media, Variância: $variancia")
end

for n in [5, 10, 50, 10000]
    media, variancia = estatisticas_amostrais(data_y, n)
    push!(medias_y, media)
    push!(vars_y, variancia)
    #println("Variável Y. Tamanho amostral: $n, Média: $media, Variância: $variancia")
end

p1 = scatter([5, 10, 50, 10000], medias_q, label="Média Q", title="Variável Q", xlabel="Tamanho amostral", ylabel="Valor")
scatter!([5, 10, 50, 10000], vars_q, label="Variância Q", labelsize=4, legend=:topright)

p2 = scatter([5, 10, 50, 10000], medias_t, label="Média T", title="Variável T", xlabel="Tamanho amostral", ylabel="Valor")
scatter!([5, 10, 50, 10000], vars_t, label="Variância T", labelsize=4, legend=:topright)

p3 = scatter([5, 10, 50, 10000], medias_x, label="Média X", title="Variável X", xlabel="Tamanho amostral", ylabel="Valor")
scatter!([5, 10, 50, 10000], vars_x, label="Variância X", labelsize=4, legend=:topright)

p4 = scatter([5, 10, 50, 10000], medias_y, label="Média Y", title="Variável Y", xlabel="Tamanho amostral", ylabel="Valor")
scatter!([5, 10, 50, 10000], vars_y, label="Variância Y", labelsize=4, legend=:topright)

plot(p1, p2, p3, p4, layout = (2, 2))

#= 
Questão 1, e:

Usando o código da questão anterior, construa os histogramas de frequências das

variáveis aleatórias média amostral e variância amostral, para os diferentes va-
lores de n e compare com as distribuições teóricas esperadas para estas variáveis.

Faça isso para as variáveis (Q, X, Y e T).
=#





#= 
Questão 1, g:

Compare os histogramas, para os diferentes valores de n, e discuta os resultados.
=#

function amostragem_aleatoria(data, n)
    amostra = rand(data, n)
    return amostra
end

amostragem_q5 = amostragem_aleatoria(data_q, 5)
amostragem_q10 = amostragem_aleatoria(data_q, 10)
amostragem_q50 = amostragem_aleatoria(data_q, 50)
amostragem_q10000 = amostragem_aleatoria(data_q, 10000)

pl1 = histogram(amostragem_q10000, bins=30, alpha=0.5, label="n = 10000", width=2, xlims=(minimum(amostragem_q10000), maximum(amostragem_q10000)))
pl2 = histogram(amostragem_q50, bins=30, alpha=0.5, label="n = 50", width=2, xlims=(minimum(amostragem_q10000), maximum(amostragem_q10000)))
pl3 = histogram(amostragem_q10, bins=10, alpha=0.5, label="n = 10", width=2, xlims=(minimum(amostragem_q10000), maximum(amostragem_q10000)))
pl4 = histogram(amostragem_q5, bins=5, alpha=0.5, label="n = 5", width=2, xlims=(minimum(amostragem_q10000), maximum(amostragem_q10000)))

plot(pl1, pl2, pl3, pl4, layout = (2, 2))