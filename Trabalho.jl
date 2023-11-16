using Plots, Distributions, StatsBase, StatsPlots, DelimitedFiles, Random, CSV, DataFrames

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

p1 = histogram(data_q, bins=40, normalize=:pdf, title="Histograma da variável Q", label="Q", xlims=(minimum(data_q), 10))
p2 = histogram(data_t, bins=40, normalize=:pdf, title="Histograma da variável T", label="T", xlims=(minimum(data_t), 10))
p3 = histogram(data_x, bins=40, normalize=:pdf, title="Histograma da variável X", label="X", xlims=(minimum(data_x), 7))
p4 = histogram(data_y, bins=40, normalize=:pdf, title="Histograma da variável Y", label="Y", xlims=(minimum(data_y), 20))

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

medias_q_5 = []
vars_q_5 = []
medias_q_10 = []
vars_q_10 = []
medias_q_50 = []
vars_q_50 = []

medias_t_5 = []
vars_t_5 = []
medias_t_10 = []
vars_t_10 = []
medias_t_50 = []
vars_t_50 = []

medias_x_5 = []
vars_x_5 = []
medias_x_10 = []
vars_x_10 = []
medias_x_50 = []
vars_x_50 = []

medias_y_5 = []
vars_y_5 = []
medias_y_10 = []
vars_y_10 = []
medias_y_50 = []
vars_y_50 = []

#Função para coletar as estatísticas de uma amostra aleatória
function estatisticas_amostrais(data, n)
    amostra = rand(data, n)
    return mean(amostra), var(amostra)
end

#Enlaces de repetição para coletar as estatísticas de 10000 amostras aleatórias
#Para variável Q
for n in 1:10000                                                        
    media, variancia = estatisticas_amostrais(data_q, 5)
    push!(medias_q_5, media)
    push!(vars_q_5, variancia)
end
a = mean(medias_q_5)
b = mean(vars_q_5)
println("Variável Q. Tamanho amostral: 5, Média: $a, Variância: $b")

for n in 1:10000
    media, variancia = estatisticas_amostrais(data_q, 10)
    push!(medias_q_10, media)
    push!(vars_q_10, variancia)
end
c = mean(medias_q_10)
d = mean(vars_q_10)
println("Variável Q. Tamanho amostral: 10, Média: $c, Variância: $d")

for n in 1:10000
    media, variancia = estatisticas_amostrais(data_q, 50)
    push!(medias_q_50, media)
    push!(vars_q_50, variancia)
end
e = mean(medias_q_50)
f = mean(vars_q_50)
println("Variável Q. Tamanho amostral: 50, Média: $e, Variância: $f")

#Para variável T
for n in 1:10000
    media, variancia = estatisticas_amostrais(data_t, 5)
    push!(medias_t_5, media)
    push!(vars_t_5, variancia)
end
g = mean(medias_t_5)
h = mean(vars_t_5)
println("Variável T. Tamanho amostral: 5, Média: $g, Variância: $h")

for n in 1:10000
    media, variancia = estatisticas_amostrais(data_t, 10)
    push!(medias_t_10, media)
    push!(vars_t_10, variancia)
end
i = mean(medias_t_10)
j = mean(vars_t_10)
println("Variável T. Tamanho amostral: 10, Média: $i, Variância: $j")

for n in 1:10000
    media, variancia = estatisticas_amostrais(data_t, 50)
    push!(medias_t_50, media)
    push!(vars_t_50, variancia)
end
k = mean(medias_t_50)
l = mean(vars_t_50)
println("Variável T. Tamanho amostral: 50, Média: $k, Variância: $l")

#Para variável X
for n in 1:10000
    media, variancia = estatisticas_amostrais(data_x, 5)
    push!(medias_x_5, media)
    push!(vars_x_5, variancia)
end
m = mean(medias_x_5)
n = mean(vars_x_5)
println("Variável X. Tamanho amostral: 5, Média: $m, Variância: $n")

for n in 1:10000
    media, variancia = estatisticas_amostrais(data_x, 10)
    push!(medias_x_10, media)
    push!(vars_x_10, variancia)
end
o = mean(medias_x_10)
p = mean(vars_x_10)
println("Variável X. Tamanho amostral: 10, Média: $o, Variância: $p")

for n in 1:10000
    media, variancia = estatisticas_amostrais(data_x, 50)
    push!(medias_x_50, media)
    push!(vars_x_50, variancia)
end
q = mean(medias_x_50)
r = mean(vars_x_50)
println("Variável X. Tamanho amostral: 50, Média: $q, Variância: $r")

#Para variável Y
for n in 1:10000
    media, variancia = estatisticas_amostrais(data_y, 5)
    push!(medias_y_5, media)
    push!(vars_y_5, variancia)
end
s = mean(medias_y_5)
t = mean(vars_y_5)
println("Variável Y. Tamanho amostral: 5, Média: $s, Variância: $t")

for n in 1:10000
    media, variancia = estatisticas_amostrais(data_y, 10)
    push!(medias_y_10, media)
    push!(vars_y_10, variancia)
end
u = mean(medias_y_10)
v = mean(vars_y_10)
println("Variável Y. Tamanho amostral: 10, Média: $u, Variância: $v")

for n in 1:10000
    media, variancia = estatisticas_amostrais(data_y, 50)
    push!(medias_y_50, media)
    push!(vars_y_50, variancia)
end
w = mean(medias_y_50)
x = mean(vars_y_50)
println("Variável Y. Tamanho amostral: 50, Média: $w, Variância: $x")

println("Minimo de media_q_5: $(minimum(medias_q_5)), Máximo de media_q_5: $(maximum(medias_q_5))")
println("Minimo de vars_q_5: $(minimum(vars_q_5)), Máximo de vars_q_5: $(maximum(vars_q_5))")

println("Minimo de media_q_10: $(minimum(medias_q_10)), Máximo de media_q_10: $(maximum(medias_q_10))")
println("Minimo de vars_q_10: $(minimum(vars_q_10)), Máximo de vars_q_10: $(maximum(vars_q_10))")

println("Minimo de media_q_50: $(minimum(medias_q_50)), Máximo de media_q_50: $(maximum(medias_q_50))")
println("Minimo de vars_q_50: $(minimum(vars_q_50)), Máximo de vars_q_50: $(maximum(vars_q_50))")

println("Minimo de media_t_5: $(minimum(medias_t_5)), Máximo de media_t_5: $(maximum(medias_t_5))")
println("Minimo de vars_t_5: $(minimum(vars_t_5)), Máximo de vars_t_5: $(maximum(vars_t_5))")

println("Minimo de media_t_10: $(minimum(medias_t_10)), Máximo de media_t_10: $(maximum(medias_t_10))")
println("Minimo de vars_t_10: $(minimum(vars_t_10)), Máximo de vars_t_10: $(maximum(vars_t_10))")

println("Minimo de media_t_50: $(minimum(medias_t_50)), Máximo de media_t_50: $(maximum(medias_t_50))")
println("Minimo de vars_t_50: $(minimum(vars_t_50)), Máximo de vars_t_50: $(maximum(vars_t_50))")

println("Minimo de media_x_5: $(minimum(medias_x_5)), Máximo de media_x_5: $(maximum(medias_x_5))")
println("Minimo de vars_x_5: $(minimum(vars_x_5)), Máximo de vars_x_5: $(maximum(vars_x_5))")

println("Minimo de media_x_10: $(minimum(medias_x_10)), Máximo de media_x_10: $(maximum(medias_x_10))")
println("Minimo de vars_x_10: $(minimum(vars_x_10)), Máximo de vars_x_10: $(maximum(vars_x_10))")

println("Minimo de media_x_50: $(minimum(medias_x_50)), Máximo de media_x_50: $(maximum(medias_x_50))")
println("Minimo de vars_x_50: $(minimum(vars_x_50)), Máximo de vars_x_50: $(maximum(vars_x_50))")

println("Minimo de media_y_5: $(minimum(medias_y_5)), Máximo de media_y_5: $(maximum(medias_y_5))")
println("Minimo de vars_y_5: $(minimum(vars_y_5)), Máximo de vars_y_5: $(maximum(vars_y_5))")

println("Minimo de media_y_10: $(minimum(medias_y_10)), Máximo de media_y_10: $(maximum(medias_y_10))")
println("Minimo de vars_y_10: $(minimum(vars_y_10)), Máximo de vars_y_10: $(maximum(vars_y_10))")

println("Minimo de media_y_50: $(minimum(medias_y_50)), Máximo de media_y_50: $(maximum(medias_y_50))")
println("Minimo de vars_y_50: $(minimum(vars_y_50)), Máximo de vars_y_50: $(maximum(vars_y_50))")


p1 = scatter([5, 10, 50], [a, c, e], label="Média Q", title="Estatísticas de Q", xlabel="Tamanho amostral", ylabel="Valor")
scatter!([5, 10, 50], [b, d, f], label="Variância Q", labelsize=4, legend=:topright)

p2 = scatter([5, 10, 50], [g, i, k], label="Média T", title="Estatísticas de T", xlabel="Tamanho amostral", ylabel="Valor")
scatter!([5, 10, 50], [h, j, l], label="Variância T", labelsize=4, legend=:topright)

p3 = scatter([5, 10, 50], [m, o, q], label="Média X", title="Estatísticas de X", xlabel="Tamanho amostral", ylabel="Valor")
scatter!([5, 10, 50], [n, p, r], label="Variância X", labelsize=4, legend=:topright)

p4 = scatter([5, 10, 50], [s, u, w], label="Média Y", title="Estatísticas de Y", xlabel="Tamanho amostral", ylabel="Valor")
scatter!([5, 10, 50], [t, v, x], label="Variância Y", labelsize=4, legend=:topright)

plot(p1, p2, p3, p4, layout = (2, 2))

#= 
Questão 1, e:

Usando o código da questão anterior, construa os histogramas de frequências das

variáveis aleatórias média amostral e variância amostral, para os diferentes va-
lores de n e compare com as distribuições teóricas esperadas para estas variáveis.

Faça isso para as variáveis (Q, X, Y e T).
=#

#Salvando os dados em arquivos .csv para importar em R
CSV.write("dados_Q5.csv", DataFrame(Medias_Q5 = medias_q_5))
CSV.write("dados_Q10.csv", DataFrame(Medias_Q10 = medias_q_10))
CSV.write("dados_Q50.csv", DataFrame(Medias_Q50 = medias_q_50))
CSV.write("dados_T5.csv", DataFrame(Medias_T5 = medias_t_5))
CSV.write("dados_T10.csv", DataFrame(Medias_T10 = medias_t_10))
CSV.write("dados_T50.csv", DataFrame(Medias_T50 = medias_t_50))
CSV.write("dados_X5.csv", DataFrame(Medias_X5 = medias_x_5))
CSV.write("dados_X10.csv", DataFrame(Medias_X10 = medias_x_10))
CSV.write("dados_X50.csv", DataFrame(Medias_X50 = medias_x_50))
CSV.write("dados_Y5.csv", DataFrame(Medias_Y5 = medias_y_5))
CSV.write("dados_Y10.csv", DataFrame(Medias_Y10 = medias_y_10))
CSV.write("dados_Y50.csv", DataFrame(Medias_Y50 = medias_y_50))

CSV.write("vars_Q5.csv", DataFrame(vars_Q5 = vars_q_5))
CSV.write("vars_Q10.csv", DataFrame(vars_Q10 = vars_q_10))
CSV.write("vars_Q50.csv", DataFrame(vars_Q50 = vars_q_50))
CSV.write("vars_T5.csv", DataFrame(vars_T5 = vars_t_5))
CSV.write("vars_T10.csv", DataFrame(vars_T10 = vars_t_10))
CSV.write("vars_T50.csv", DataFrame(vars_T50 = vars_t_50))
CSV.write("vars_X5.csv", DataFrame(vars_X5 = vars_x_5))
CSV.write("vars_X10.csv", DataFrame(vars_X10 = vars_x_10))
CSV.write("vars_X50.csv", DataFrame(vars_X50 = vars_x_50))
CSV.write("vars_Y5.csv", DataFrame(vars_Y5 = vars_y_5))
CSV.write("vars_Y10.csv", DataFrame(vars_Y10 = vars_y_10))
CSV.write("vars_Y50.csv", DataFrame(vars_Y50 = vars_y_50))

#= 
Questão 1, g:

Compare os histogramas, para os diferentes valores de n, e discuta os resultados.
=#

#Histogramas para variâncias amostrais
v1 = histogram(vars_q_5, bins=30, alpha=0.5, label="Q, n=5", normalize=:pdf, title = "Var. Amostrais Q")
histogram!(vars_q_10, bins=30, alpha=0.5, label="Q, n=10", normalize=:pdf)
histogram!(vars_q_50, bins=30, alpha=0.5, label="Q, n=50", normalize=:pdf)

v2 = histogram(vars_t_5, bins=30, alpha=0.5, label="T, n=5", normalize=:pdf, title = "Var. Amostrais T")
histogram!(vars_t_10, bins=30, alpha=0.5, label="T, n=10", normalize=:pdf)
histogram!(vars_t_50, bins=30, alpha=0.5, label="T, n=50", normalize=:pdf)

v3 = histogram(vars_x_5, bins=30, alpha=0.5, label="X, n=5", normalize=:pdf, title = "Var. Amostrais X")
histogram!(vars_x_10, bins=30, alpha=0.5, label="X, n=10", normalize=:pdf)
histogram!(vars_x_50, bins=30, alpha=0.5, label="X, n=50", normalize=:pdf)

v4 = histogram(vars_y_5, bins=30, alpha=0.5, label="Y, n=5", normalize=:pdf, xlims=(0, 75), title = "Var. Amostrais Y")
histogram!(vars_y_10, bins=30, alpha=0.5, label="Y, n=10", normalize=:pdf)
histogram!(vars_y_50, bins=30, alpha=0.5, label="Y, n=50", normalize=:pdf)

plot(v1, v2, v3, v4, layout=(2, 2), legend=:topright)

#Histogramas para médias amostrais
h1 = histogram(medias_q_5, bins=10, alpha=0.5, label="Q, n=5", normalize=:pdf, title = "Méd. Amostrais Q")
histogram!(medias_q_10, bins=10, alpha=0.5, label="Q, n=10", normalize=:pdf)
histogram!(medias_q_50, bins=10, alpha=0.5, label="Q, n=50", normalize=:pdf)

h2 = histogram(medias_t_5, bins=10, alpha=0.5, label="T, n=5", normalize=:pdf, title = "Méd. Amostrais T")
histogram!(medias_t_10, bins=10, alpha=0.5, label="T, n=10", normalize=:pdf)
histogram!(medias_t_50, bins=10, alpha=0.5, label="T, n=50", normalize=:pdf)

h3 = histogram(medias_x_5, bins=10, alpha=0.5, label="X, n=5", normalize=:pdf, title = "Méd. Amostrais X")
histogram!(medias_x_10, bins=10, alpha=0.5, label="X, n=10", normalize=:pdf)
histogram!(medias_x_50, bins=10, alpha=0.5, label="X, n=50", normalize=:pdf)

h4 = histogram(medias_y_5, bins=10, alpha=0.5, label="Y, n=5", normalize=:pdf, title = "Méd. Amostrais Y")
histogram!(medias_y_10, bins=10, alpha=0.5, label="Y, n=10", normalize=:pdf)
histogram!(medias_y_50, bins=10, alpha=0.5, label="Y, n=50", normalize=:pdf)

plot(h1, h2, h3, h4, layout=(2, 2), legend=:topright)