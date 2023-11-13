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

#= p1 = scatter([5, 10, 50], [a, c, e], label="Média Q", title="Estatísticas de Q", xlabel="Tamanho amostral", ylabel="Valor")
scatter!([5, 10, 50], [b, d, f], label="Variância Q", labelsize=4, legend=:topright)

p2 = scatter([5, 10, 50], [g, i, k], label="Média T", title="Estatísticas de T", xlabel="Tamanho amostral", ylabel="Valor")
scatter!([5, 10, 50], [h, j, l], label="Variância T", labelsize=4, legend=:topright)

p3 = scatter([5, 10, 50], [m, o, q], label="Média X", title="Estatísticas de X", xlabel="Tamanho amostral", ylabel="Valor")
scatter!([5, 10, 50], [n, p, r], label="Variância X", labelsize=4, legend=:topright)

p4 = scatter([5, 10, 50], [s, u, w], label="Média Y", title="Estatísticas de Y", xlabel="Tamanho amostral", ylabel="Valor")
scatter!([5, 10, 50], [t, v, x], label="Variância Y", labelsize=4, legend=:topright)

plot(p1, p2, p3, p4, layout = (2, 2)) =#

#= 
Questão 1, e:

Usando o código da questão anterior, construa os histogramas de frequências das

variáveis aleatórias média amostral e variância amostral, para os diferentes va-
lores de n e compare com as distribuições teóricas esperadas para estas variáveis.

Faça isso para as variáveis (Q, X, Y e T).
=#

dQ5r = CSV.File("dados_Q5.csv") |> DataFrame

column_nameq2 = :Density
column_nameq1 = :Q5
density_q5 = dQ5r[!, column_nameq2]
values_q5 = dQ5r[!, column_nameq1]

dQ10r = CSV.File("dados_Q10.csv") |> DataFrame

column_nameq4 = :Density
column_nameq3 = :Q10
density_q10 = dQ10r[!, column_nameq3]
values_q10 = dQ10r[!, column_nameq4]

dQ50r = CSV.File("dados_Q50.csv") |> DataFrame

column_nameq6 = :Density
column_nameq5 = :Q50
density_q50 = dQ50r[!, column_nameq5]
values_q50 = dQ50r[!, column_nameq6]

dT5r = CSV.File("dados_T5.csv") |> DataFrame

column_namet2 = :Density
column_namet1 = :T5
density_t5 = dT5r[!, column_namet2]
values_t5 = dT5r[!, column_namet1]

dT10r = CSV.File("dados_T10.csv") |> DataFrame

column_namet4 = :Density
column_namet3 = :T10
density_t10 = dT10r[!, column_namet3]
values_t10 = dT10r[!, column_namet4]

dT50r = CSV.File("dados_T50.csv") |> DataFrame

column_namet6 = :Density
column_namet5 = :T50
density_t50 = dT50r[!, column_namet5]
values_t50 = dT50r[!, column_namet6]

dX5r = CSV.File("dados_X5.csv") |> DataFrame

column_nameX2 = :Density
column_nameX1 = :X5
density_X5 = dX5r[!, column_nameX2]
values_X5 = dX5r[!, column_nameX1]

dX10r = CSV.File("dados_X10.csv") |> DataFrame

column_nameX4 = :Density
column_nameX3 = :X10
density_X10 = dX10r[!, column_nameX3]
values_X10 = dX10r[!, column_nameX4]

dX50r = CSV.File("dados_X50.csv") |> DataFrame

column_nameX6 = :Density
column_nameX5 = :X50
density_X50 = dX50r[!, column_nameX5]
values_X50 = dX50r[!, column_nameX6]

dY5r = CSV.File("dados_Y5.csv") |> DataFrame

column_nameY2 = :Density
column_nameY1 = :Y5
density_Y5 = dY5r[!, column_nameY2]
values_Y5 = dY5r[!, column_nameY1]

dY10r = CSV.File("dados_Y10.csv") |> DataFrame

column_nameY4 = :Density
column_nameY3 = :Y10
density_Y10 = dY10r[!, column_nameY3]
values_Y10 = dY10r[!, column_nameY4]

dY50r = CSV.File("dados_Y50.csv") |> DataFrame

column_nameY6 = :Density
column_nameY5 = :Y50
density_Y50 = dY50r[!, column_nameY5]
values_Y50 = dY50r[!, column_nameY6]

#= v1 = histogram(vars_q_5, bins=30, alpha=0.5, label="Q, n=5", normalize=:probability)
histogram!(vars_q_10, bins=30, alpha=0.5, label="Q, n=10", normalize=:probability)
histogram!(vars_q_50, bins=30, alpha=0.5, label="Q, n=50", normalize=:probability)

v2 = histogram(vars_t_5, bins=30, alpha=0.5, label="T, n=5", normalize=:probability)
histogram!(vars_t_10, bins=30, alpha=0.5, label="T, n=10", normalize=:probability)
histogram!(vars_t_50, bins=30, alpha=0.5, label="T, n=50", normalize=:probability)

v3 = histogram(vars_x_5, bins=30, alpha=0.5, label="X, n=5", normalize=:probability)
histogram!(vars_x_10, bins=30, alpha=0.5, label="X, n=10", normalize=:probability)
histogram!(vars_x_50, bins=30, alpha=0.5, label="X, n=50", normalize=:probability)

v4 = histogram(vars_y_5, bins=30, alpha=0.5, label="Y, n=5", normalize=:probability, xlims=(0, 75))
histogram!(vars_y_10, bins=30, alpha=0.5, label="Y, n=10", normalize=:probability)
histogram!(vars_y_50, bins=30, alpha=0.5, label="Y, n=50", normalize=:probability)

plot(v1, v2, v3, v4, layout=(2, 2), legend=:topright) =#

#= # Plotting for medias_q
h1 = histogram(medias_q_5, bins=10, alpha=0.5, label="Q, n=5", normalize=:probability)
histogram!(medias_q_10, bins=10, alpha=0.5, label="Q, n=10", normalize=:probability)
histogram!(medias_q_50, bins=10, alpha=0.5, label="Q, n=50", normalize=:probability)
density!(density_q5, values_q5, seriestype=:density, label="Q, n=5", xlabel="valores", ylabel="densidade", smooth=true)
density!(density_q10, values_q10, seriestype=:density, label="Q, n=10", xlabel="valores", ylabel="densidade", smooth=true)
density!(density_q50, values_q50, seriestype=:density, label="Q, n=50", xlabel="valores", ylabel="densidade", smooth=true)

# Plotting for medias_t
h2 = histogram(medias_t_5, bins=10, alpha=0.5, label="T, n=5", normalize=:probability)
histogram!(medias_t_10, bins=10, alpha=0.5, label="T, n=10", normalize=:probability)
histogram!(medias_t_50, bins=10, alpha=0.5, label="T, n=50", normalize=:probability)
density!(density_t5, values_t5, seriestype=:density, label="T, n=5", xlabel="valores", ylabel="densidade", smooth=true)
density!(density_t10, values_t10, seriestype=:density, label="T, n=10", xlabel="valores", ylabel="densidade", smooth=true)
density!(density_t50, values_t50, seriestype=:density, label="T, n=50", xlabel="valores", ylabel="densidade", smooth=true)

# Plotting for medias_x
h3 = histogram(medias_x_5, bins=10, alpha=0.5, label="X, n=5", normalize=:probability)
histogram!(medias_x_10, bins=10, alpha=0.5, label="X, n=10", normalize=:probability)
histogram!(medias_x_50, bins=10, alpha=0.5, label="X, n=50", normalize=:probability)
density!(density_X5, values_X5, seriestype=:density, label="X, n=5", xlabel="valores", ylabel="densidade", smooth=true)
density!(density_X10, values_X10, seriestype=:density, label="X, n=10", xlabel="valores", ylabel="densidade", smooth=true)
density!(density_X50, values_X50, seriestype=:density, label="X, n=50", xlabel="valores", ylabel="densidade", smooth=true)

# Plotting for medias_y
h4 = histogram(medias_y_5, bins=10, alpha=0.5, label="Y, n=5", normalize=:probability)
histogram!(medias_y_10, bins=10, alpha=0.5, label="Y, n=10", normalize=:probability)
histogram!(medias_y_50, bins=10, alpha=0.5, label="Y, n=50", normalize=:probability)
density!(density_Y5, values_Y5, seriestype=:density, label="Y, n=5", xlabel="valores", ylabel="densidade", smooth=true)
density!(density_Y10, values_Y10, seriestype=:density, label="Y, n=10", xlabel="valores", ylabel="densidade", smooth=true)
density!(density_Y50, values_Y50, seriestype=:density, label="Y, n=50", xlabel="valores", ylabel="densidade", smooth=true)

# Plotting the histograms in a 2x2 layout
plot(h1, h2, h3, h4, layout=(2, 2), legend=:topright, ylims=(0, 1)) =#




#= 
Questão 1, g:

Compare os histogramas, para os diferentes valores de n, e discuta os resultados.
=#

#= function amostragem_aleatoria(data, n)
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

plot(pl1, pl2, pl3, pl4, layout = (2, 2)) =#