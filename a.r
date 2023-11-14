library(ggplot2) 

tam <- seq(0, 6, length.out = 10000)

#Variavel Q
Q5.mean <- 3
Q5.sd <- 3/5
Q5.dist <- dnorm(tam, mean = Q5.mean, sd = Q5.sd)
Q5.df <- data.frame("Q" = tam, "Density" = Q5.dist, "Type" = "Q5")

Q10.mean <- 3
Q10.sd <- 3/10
Q10.dist <- dnorm(tam, mean = Q10.mean, sd = Q10.sd)
Q10.df <- data.frame("Q" = tam, "Density" = Q10.dist, "Type" = "Q10")

Q50.mean <- 3
Q50.sd <- 3/50
Q50.dist <- dnorm(tam, mean = Q50.mean, sd = Q50.sd)
Q50.df <- data.frame("Q" = tam, "Density" = Q50.dist, "Type" = "Q50")

combined_df <- rbind(Q5.df, Q10.df, Q50.df)

ggplot(combined_df, aes(x = Q, y = Density, color = Type)) +
  geom_line(size = 0.3) + 
  geom_point() +
  labs(title = "Normal teórica de Q", x = "Q", y = "Densidade") +
  theme_minimal()


#Variavel X
tam <- seq(0.44, 5.5, length.out = 10000)

X5.mean <- 3
X5.sd <- 3/5
X5.dist <- dnorm(tam, mean = X5.mean, sd = X5.sd)
X5.df <- data.frame("X" = tam, "Density" = X5.dist, "Type" = "X5")
  
X10.mean <- 3
X10.sd <- 3/10
X10.dist <- dnorm(tam, mean = X10.mean, sd = X10.sd)
X10.df <- data.frame("X" = tam, "Density" = X10.dist, "Type" = "X10")
  
X50.mean <- 3
X50.sd <- 3/50
X50.dist <- dnorm(tam, mean = X50.mean, sd = X50.sd)
X50.df <- data.frame("X" = tam, "Density" = X50.dist, "Type" = "X50")
  
combined_df <- rbind(X5.df, X10.df, X50.df)
  
ggplot(combined_df, aes(x = X, y = Density, color = Type)) +
  geom_line(size = 0.3) + 
  geom_point() +
  labs(title = "Normal teórica de X", x = "X", y = "Densidade") +
  theme_minimal()

# Variavel Y
tam <- seq(0, 8, length.out = 10000)
Y5.mean <- 3.003
Y5.sd <- 9.018/5
Y5.dist <- dnorm(tam, mean = Y5.mean, sd = Y5.sd)
Y5.df <- data.frame("Y" = tam, "Density" = Y5.dist, "Type" = "Y5")
  
Y10.mean <- 3.003
Y10.sd <- 9.018/10
Y10.dist <- dnorm(tam, mean = Y10.mean, sd = Y10.sd)
Y10.df <- data.frame("Y" = tam, "Density" = Y10.dist, "Type" = "Y10")
  
Y50.mean <- 3.003
Y50.sd <- 9.018/50
Y50.dist <- dnorm(tam, mean = Y50.mean, sd = Y50.sd)
Y50.df <- data.frame("Y" = tam, "Density" = Y50.dist, "Type" = "Y50")
  
combined_df <- rbind(Y5.df, Y10.df, Y50.df)

ggplot(combined_df, aes(x = Y, y = Density, color = Type)) +
  geom_line(size = 0.3) + 
  geom_point() +
  labs(title = "Normal teórica de Y", x = "Y", y = "Densidade") +
  theme_minimal()

# Variavel T
tam <- seq(0.8, 5.6, length.out = 10000)
T5.mean <- 3
T5.sd <- 2.1/5
T5.dist <- dnorm(tam, mean = T5.mean, sd = T5.sd)
T5.df <- data.frame("T" = tam, "Density" = T5.dist, "Type" = "T5")
  
T10.mean <- 3
T10.sd <- 2.1/10
T10.dist <- dnorm(tam, mean = T10.mean, sd = T10.sd)
T10.df <- data.frame("T" = tam, "Density" = T10.dist, "Type" = "T10")

T50.mean <- 3
T50.sd <- 2.1/50
T50.dist <- dnorm(tam, mean = T50.mean, sd = T50.sd)
T50.df <- data.frame("T" = tam, "Density" = T50.dist, "Type" = "T50")
  
combined_df <- rbind(T5.df, T10.df, T50.df)
  
ggplot(combined_df, aes(x = T, y = Density, color = Type)) +
  geom_line(size = 0.3) + 
  geom_point() +
  labs(title = "Normal teórica de T", x = "T", y = "Densidade") +
  theme_minimal()
  





#write.csv(T50.df, "dados_T50.csv", row.names = FALSE)

