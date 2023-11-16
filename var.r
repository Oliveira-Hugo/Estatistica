library(ggplot2) 

##Leitura de variancias
vars_Q5 <- read.csv("vars_Q5.csv")
vars_Q10 <- read.csv("vars_Q10.csv")
vars_Q50 <- read.csv("vars_Q50.csv")
vars_X5 <- read.csv("vars_X5.csv")
vars_X10 <- read.csv("vars_X10.csv")
vars_X50 <- read.csv("vars_X50.csv")
vars_T5 <- read.csv("vars_T5.csv")
vars_T10 <- read.csv("vars_T10.csv")
vars_T50 <- read.csv("vars_T50.csv")
vars_Y5 <- read.csv("vars_Y5.csv")
vars_Y10 <- read.csv("vars_Y10.csv")
vars_Y50 <- read.csv("vars_Y50.csv")

#Tratando os dados como numericos
vars_Q5_numeric <- as.numeric(vars_Q5$vars_Q5)
vars_Q10_numeric <- as.numeric(vars_Q10$vars_Q10)
vars_Q50_numeric <- as.numeric(vars_Q50$vars_Q50)
vars_X5_numeric <- as.numeric(vars_X5$vars_X5)
vars_X10_numeric <- as.numeric(vars_X10$vars_X10)
vars_X50_numeric <- as.numeric(vars_X50$vars_X50)
vars_T5_numeric <- as.numeric(vars_T5$vars_T5)
vars_T10_numeric <- as.numeric(vars_T10$vars_T10)
vars_T50_numeric <- as.numeric(vars_T50$vars_T50)
vars_Y5_numeric <- as.numeric(vars_Y5$vars_Y5)
vars_Y10_numeric <- as.numeric(vars_Y10$vars_Y10)
vars_Y50_numeric <- as.numeric(vars_Y50$vars_Y50)


##Gerar histogramas das variâncias
h1 <- hist(vars_Q5_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=5", xlab = "Values", ylab = "Density")
h2 <- hist(vars_Q10_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=10", xlab = "Values", ylab = "Density")
h3 <- hist(vars_Q50_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=50", xlab = "Values", ylab = "Density")
h4 <- hist(vars_X5_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=5", xlab = "Values", ylab = "Density")
h5 <- hist(vars_X10_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=10", xlab = "Values", ylab = "Density")
h6 <- hist(vars_X50_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=50", xlab = "Values", ylab = "Density")
h7 <- hist(vars_T5_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=5", xlab = "Values", ylab = "Density")
h8 <- hist(vars_T10_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=10", xlab = "Values", ylab = "Density")
h9 <- hist(vars_T50_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=50", xlab = "Values", ylab = "Density")
h10 <- hist(vars_Y5_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=5", xlab = "Values", ylab = "Density")
h11 <- hist(vars_Y10_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=10", xlab = "Values", ylab = "Density")
h12 <- hist(vars_Y50_numeric, breaks = 10, probability = TRUE, col = "lightblue", border = "black", main = "Q, n=50", xlab = "Values", ylab = "Density")

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

##Gerar normais teóricas para variancia amostral
#Variavel Q
tam <- seq(0.015, 10, length.out = 10000)
Q5.mean <- 3
Q5.sd <- var(vars_Q5_numeric)
Q5.dist <- dnorm(tam, mean = Q5.mean, sd = sqrt(Q5.sd))
Q5.df <- data.frame("Q" = tam, "Density" = Q5.dist, "Type" = "Q5")

Q10.mean <- 3
Q10.sd <- var(vars_Q10_numeric)
Q10.dist <- dnorm(tam, mean = Q10.mean, sd = sqrt(Q10.sd))
Q10.df <- data.frame("Q" = tam, "Density" = Q10.dist, "Type" = "Q10")

Q50.mean <- 3
Q50.sd <- var(vars_Q50_numeric)
Q50.dist <- dnorm(tam, mean = Q50.mean, sd = sqrt(Q50.sd))
Q50.df <- data.frame("Q" = tam, "Density" = Q50.dist, "Type" = "Q50")

density_df <- rbind(Q5.df, Q10.df, Q50.df)

ggplot() +
  geom_bar(data = h1_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h2_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h3_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_line(data = density_df, aes(x = Q, y = Density, color = Type), size = 0.3) +
  geom_point(data = density_df, aes(x = Q, y = Density, color = Type)) +
  labs(title = "Distribuição e normal teórica da variância amostral Q", x = "Q", y = "Densidade") +
  scale_fill_manual(values = c("red", "green", "blue")) +
  theme_minimal()

#Variavel X
tam <- seq(0.03, 9, length.out = 10000)

X5.mean <- 3
X5.sd <- var(vars_X5_numeric)
X5.dist <- dnorm(tam, mean = X5.mean, sd = sqrt(X5.sd))
X5.df <- data.frame("X" = tam, "Density" = X5.dist, "Type" = "X5")
  
X10.mean <- 3
X10.sd <- var(vars_X10_numeric)
X10.dist <- dnorm(tam, mean = X10.mean, sd = sqrt(X10.sd))
X10.df <- data.frame("X" = tam, "Density" = X10.dist, "Type" = "X10")
  
X50.mean <- 3
X50.sd <- var(vars_X50_numeric)
X50.dist <- dnorm(tam, mean = X50.mean, sd = sqrt(X50.sd))
X50.df <- data.frame("X" = tam, "Density" = X50.dist, "Type" = "X50")
  
density_df <- rbind(X5.df, X10.df, X50.df)

ggplot() +
  geom_bar(data = h4_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h5_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h6_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_line(data = density_df, aes(x = X, y = Density, color = Type), size = 0.3) +
  geom_point(data = density_df, aes(x = X, y = Density, color = Type)) +
  labs(title = "Distribuição e normal teórica da variância amostral X", x = "X", y = "Densidade") +
  scale_fill_manual(values = c("red", "green", "blue")) +
  theme_minimal()

# Variavel Y
tam <- seq(0.015, 60, length.out = 10000)
Y5.mean <- 9
Y5.sd <- var(vars_Y5_numeric)
Y5.dist <- dnorm(tam, mean = Y5.mean, sd = sqrt(Y5.sd))
Y5.df <- data.frame("Y" = tam, "Density" = Y5.dist, "Type" = "Y5")
  
Y10.mean <- 9
Y10.sd <- var(vars_Y10_numeric)
Y10.dist <- dnorm(tam, mean = Y10.mean, sd = sqrt(Y10.sd))
Y10.df <- data.frame("Y" = tam, "Density" = Y10.dist, "Type" = "Y10")
  
Y50.mean <- 9
Y50.sd <- var(vars_Y50_numeric)
Y50.dist <- dnorm(tam, mean = Y50.mean, sd = sqrt(Y50.sd))
Y50.df <- data.frame("Y" = tam, "Density" = Y50.dist, "Type" = "Y50")
  
density_df <- rbind(Y5.df, Y10.df, Y50.df)

ggplot() +
  geom_bar(data = h10_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h11_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_bar(data = h12_df, aes(x = x, y = density, fill = label), stat = "identity", alpha = 0.3, width = 0.3) +
  geom_line(data = density_df, aes(x = Y, y = Density, color = Type), size = 0.3) +
  geom_point(data = density_df, aes(x = Y, y = Density, color = Type)) +
  labs(title = "Distribuição e normal teórica da variância amostral Y", x = "Y", y = "Densidade") +
  scale_fill_manual(values = c("red", "green", "blue")) +
  xlim(0, 70) + 
  theme_minimal()

# Variavel T
tam <- seq(0, 9, length.out = 10000)
T5.mean <- 2.1
T5.sd <- var(vars_T5_numeric)
T5.dist <- dnorm(tam, mean = T5.mean, sd = sqrt(T5.sd))
T5.df <- data.frame("T" = tam, "Density" = T5.dist, "Type" = "T5")
  
T10.mean <- 2.1
T10.sd <- var(vars_T10_numeric)
T10.dist <- dnorm(tam, mean = T10.mean, sd = sqrt(T10.sd))
T10.df <- data.frame("T" = tam, "Density" = T10.dist, "Type" = "T10")

T50.mean <- 2.1
T50.sd <- var(vars_T50_numeric)
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
  xlim(0, 10) + 
  theme_minimal()