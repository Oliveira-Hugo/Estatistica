library(ggplot2) 

#Leitura de medias
media_Q5 <- read.csv("dados_Q5.csv")
media_Q10 <- read.csv("dados_Q10.csv")
media_Q50 <- read.csv("dados_Q50.csv")
media_X5 <- read.csv("dados_X5.csv")
media_X10 <- read.csv("dados_X10.csv")
media_X50 <- read.csv("dados_X50.csv")
media_T5 <- read.csv("dados_T5.csv")
media_T10 <- read.csv("dados_T10.csv")
media_T50 <- read.csv("dados_T50.csv")
media_Y5 <- read.csv("dados_Y5.csv")
media_Y10 <- read.csv("dados_Y10.csv")
media_Y50 <- read.csv("dados_Y50.csv")

#Tratando os dados como numericos
media_Q5_numeric <- as.numeric(media_Q5$Medias_Q5)
media_Q10_numeric <- as.numeric(media_Q10$Medias_Q10)
media_Q50_numeric <- as.numeric(media_Q50$Medias_Q50)
media_X5_numeric <- as.numeric(media_X5$Medias_X5)
media_X10_numeric <- as.numeric(media_X10$Medias_X10)
media_X50_numeric <- as.numeric(media_X50$Medias_X50)
media_T5_numeric <- as.numeric(media_T5$Medias_T5)
media_T10_numeric <- as.numeric(media_T10$Medias_T10)
media_T50_numeric <- as.numeric(media_T50$Medias_T50)
media_Y5_numeric <- as.numeric(media_Y5$Medias_Y5)
media_Y10_numeric <- as.numeric(media_Y10$Medias_Y10)
media_Y50_numeric <- as.numeric(media_Y50$Medias_Y50)

##Gerar histogramas das medias
h1 <- hist(media_Q5_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=5", xlab = "Values", ylab = "Density")
h2 <- hist(media_Q10_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=10", xlab = "Values", ylab = "Density")
h3 <- hist(media_Q50_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=50", xlab = "Values", ylab = "Density")
h4 <- hist(media_X5_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=5", xlab = "Values", ylab = "Density")
h5 <- hist(media_X10_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=10", xlab = "Values", ylab = "Density")
h6 <- hist(media_X50_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=50", xlab = "Values", ylab = "Density")
h7 <- hist(media_T5_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=5", xlab = "Values", ylab = "Density")
h8 <- hist(media_T10_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=10", xlab = "Values", ylab = "Density")
h9 <- hist(media_T50_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=50", xlab = "Values", ylab = "Density")
h10 <- hist(media_Y5_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=5", xlab = "Values", ylab = "Density")
h11 <- hist(media_Y10_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=10", xlab = "Values", ylab = "Density")
h12 <- hist(media_Y50_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=50", xlab = "Values", ylab = "Density")

h1_df <- data.frame(x = h1$mids, density = h1$density, label = "Q, n=5")
h2_df <- data.frame(x = h2$mids, density = h2$density, label = "Q, n=10")
h3_df <- data.frame(x = h3$mids, density = h3$density, label = "Q, n=50")
h4_df <- data.frame(x = h4$mids, density = h4$density, label = "X, n=5")
h5_df <- data.frame(x = h5$mids, density = h5$density, label = "X, n=10")
h6_df <- data.frame(x = h6$mids, density = h6$density, label = "X, n=50")
h7_df <- data.frame(x = h7$mids, density = h7$density, label = "T, n=5")
h8_df <- data.frame(x = h8$mids, density = h8$density, label = "T, n=10")
h9_df <- data.frame(x = h9$mids, density = h9$density, label = "T, n=50")
h10_df <- data.frame(x = h10$mids, density = h10$density, label = "Y, n=5")
h11_df <- data.frame(x = h11$mids, density = h11$density, label = "Y, n=10")
h12_df <- data.frame(x = h12$mids, density = h12$density, label = "Y, n=50")

##Gerar normais teóricas para media amostral
#Variavel Q
tam <- seq(0, 6, length.out = 10000)
Q5.mean <- 3
Q5.sd <- 3/5
Q5.dist <- dnorm(tam, mean = Q5.mean, sd = sqrt(Q5.sd))
Q5.df <- data.frame("Q" = tam, "Density" = Q5.dist, "Type" = "Q5")

Q10.mean <- 3
Q10.sd <- 3/10
Q10.dist <- dnorm(tam, mean = Q10.mean, sd = sqrt(Q10.sd))
Q10.df <- data.frame("Q" = tam, "Density" = Q10.dist, "Type" = "Q10")

Q50.mean <- 3
Q50.sd <- 3/50
Q50.dist <- dnorm(tam, mean = Q50.mean, sd = sqrt(Q50.sd))
Q50.df <- data.frame("Q" = tam, "Density" = Q50.dist, "Type" = "Q50")

density_df <- rbind(Q5.df, Q10.df, Q50.df)


ggplot() +
  geom_bar(data = h1_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h2_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h3_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_line(data = density_df, aes(x = Q, y = Density, color = Type), size = 0.3) +
  geom_point(data = density_df, aes(x = Q, y = Density, color = Type)) +
  labs(title = "Distribuição e normal teórica da média amostral Q", x = "Q", y = "Densidade") +
  scale_fill_manual(values = c("red", "green", "blue")) +
  theme_minimal()

#Variavel X
tam <- seq(0.44, 5.5, length.out = 10000)

X5.mean <- 3
X5.sd <- 3/5
X5.dist <- dnorm(tam, mean = X5.mean, sd = sqrt(X5.sd))
X5.df <- data.frame("X" = tam, "Density" = X5.dist, "Type" = "X5")
  
X10.mean <- 3
X10.sd <- 3/10
X10.dist <- dnorm(tam, mean = X10.mean, sd = sqrt(X10.sd))
X10.df <- data.frame("X" = tam, "Density" = X10.dist, "Type" = "X10")
  
X50.mean <- 3
X50.sd <- 3/50
X50.dist <- dnorm(tam, mean = X50.mean, sd = sqrt(X50.sd))
X50.df <- data.frame("X" = tam, "Density" = X50.dist, "Type" = "X50")
  
density_df <- rbind(X5.df, X10.df, X50.df)

ggplot() +
  geom_bar(data = h4_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h5_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h6_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_line(data = density_df, aes(x = X, y = Density, color = Type), size = 0.3) +
  geom_point(data = density_df, aes(x = X, y = Density, color = Type)) +
  labs(title = "Distribuição e normal teórica da média amostral X", x = "X", y = "Densidade") +
  scale_fill_manual(values = c("red", "green", "blue")) +
  theme_minimal()

# Variavel Y
tam <- seq(0, 8, length.out = 10000)
Y5.mean <- 3.003
Y5.sd <- 9.018/5
Y5.dist <- dnorm(tam, mean = Y5.mean, sd = sqrt(Y5.sd))
Y5.df <- data.frame("Y" = tam, "Density" = Y5.dist, "Type" = "Y5")
  
Y10.mean <- 3.003
Y10.sd <- 9.018/10
Y10.dist <- dnorm(tam, mean = Y10.mean, sd = sqrt(Y10.sd))
Y10.df <- data.frame("Y" = tam, "Density" = Y10.dist, "Type" = "Y10")
  
Y50.mean <- 3.003
Y50.sd <- 9.018/50
Y50.dist <- dnorm(tam, mean = Y50.mean, sd = sqrt(Y50.sd))
Y50.df <- data.frame("Y" = tam, "Density" = Y50.dist, "Type" = "Y50")
  
density_df <- rbind(Y5.df, Y10.df, Y50.df)

ggplot() +
  geom_bar(data = h10_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h11_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h12_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_line(data = density_df, aes(x = Y, y = Density, color = Type), size = 0.3) +
  geom_point(data = density_df, aes(x = Y, y = Density, color = Type)) +
  labs(title = "Distribuição e normal teórica da média amostral Y", x = "Y", y = "Densidade") +
  scale_fill_manual(values = c("red", "green", "blue")) +
  theme_minimal()

# Variavel T
tam <- seq(0.8, 5.6, length.out = 10000)
T5.mean <- 3
T5.sd <- 2.1/5
T5.dist <- dnorm(tam, mean = T5.mean, sd = sqrt(T5.sd))
T5.df <- data.frame("T" = tam, "Density" = T5.dist, "Type" = "T5")
  
T10.mean <- 3
T10.sd <- 2.1/10
T10.dist <- dnorm(tam, mean = T10.mean, sd = sqrt(T10.sd))
T10.df <- data.frame("T" = tam, "Density" = T10.dist, "Type" = "T10")

T50.mean <- 3
T50.sd <- 2.1/50
T50.dist <- dnorm(tam, mean = T50.mean, sd = sqrt(T50.sd))
T50.df <- data.frame("T" = tam, "Density" = T50.dist, "Type" = "T50")
  
density_df <- rbind(T5.df, T10.df, T50.df)
  
ggplot() +
  geom_bar(data = h7_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h8_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h9_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_line(data = density_df, aes(x = T, y = Density, color = Type), size = 0.3) +
  geom_point(data = density_df, aes(x = T, y = Density, color = Type)) +
  labs(title = "Distribuição e normal teórica da média amostral T", x = "T", y = "Densidade") +
  scale_fill_manual(values = c("red", "green", "blue")) +
  theme_minimal()