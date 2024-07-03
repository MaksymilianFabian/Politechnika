# Zadanie 1
data <- read.csv("dane.csv", sep=";")

# a) Obliczanie kwantyla trzeciego i odchylenia standardowego
data <- na.omit(data$energia)
Q3 <- quantile(data, probs = 0.75)
std_dev <- sd(data)

cat("Kwantyl trzeci:", Q3, "\n")
cat("Odchylenie standardowe:", std_dev, "\n")
cat("Interpretacja:\nKwantyl trzeci (Q3) wynosi około 317,45. Oznacza to, że 75% miesięcznych wartości zużycia energii elektrycznej jest poniżej tej wartości.
\nOdchylenie standardowe zużycia energii elektrycznej wynosi około 53 kWh. Oznacza to, że średnia miesięcznego zużycia energii elektrycznej różni się średnio o 53 kWh od wartości oczekiwanej.")

# b) Konstrukcja szeregu rozdzielczego i przedziałowego
breaks <- seq(180, 420, length.out = 6)
hist_data <- hist(data, breaks = breaks, plot = FALSE)

cat("\nSzereg rozdzielczy i przedziałowy:\n")
cat("Przedziały:", hist_data$breaks, "\n")
cat("Liczebności:", hist_data$counts, "\n")

# c) Narysowanie wykresu kołowego
labels <- paste(hist_data$breaks[-1], hist_data$breaks[-length(hist_data$breaks)], sep=" - ")
labels <- paste(labels, "kWh", sep=" ")
pie(hist_data$counts, labels = labels, main = "Zużycie energii elektrycznej")

# Zadanie 2
h <- 3

lambda <- 1 / h

# Zakres dla osi x
x_values <- seq(0, 25, by = 0.1)

# Obliczenie wartości rozkładu wykładniczego dla każdej wartości x
y_values <- dexp(x_values, rate = lambda)

# Narysowanie wykresu rozkładu wykładniczego
plot(x_values, y_values, type = "l", col = "blue", lwd = 2,
     xlab = "Liczba rozpadów", ylab = "Prawdopodobieństwo",
     main = "Rozkład wykładniczy")

prob <- pexp(3, rate = lambda)

cat("Prawdopodobieństwo, że dekoder zarejestruje nie więcej niż 3 rozpady promieniotwórcze:", prob, "\n")

#zadanie 3
mu <- 168
sigma <- 5

n <- 40


# a) Rozkład średniego wzrostu 40 wylosowanych kobiet
mu_x_bar <- mu
sigma_x_bar <- sigma / sqrt(n)

cat("a) Rozkład średniego wzrostu 40 wylosowanych kobiet:\n")
cat("Średnia:", mu_x_bar, "cm\n")
cat("Odchylenie standardowe:", sigma_x_bar, "cm\n\n")

z1 <- (164 - mu_x_bar) / sigma_x_bar
z2 <- (167 - mu_x_bar) / sigma_x_bar

prob <- pnorm(z2) - pnorm(z1)

cat("b) Prawdopodobieństwo, że średni wzrost 40 wylosowanych kobiet mieści się w przedziale 164 do 167 cm:", prob, "\n")

#zadanie 4
data <- read.csv("dane.csv", sep=";")
dane <- na.omit(data$moc)

moc <- dane
n <- length(moc)

srednia <- mean(moc)
odchylenie <- sd(moc)

alpha <- 1 - 0.93

przedzial_ufnosci <- t.test(moc, conf.level = 1 - alpha)

cat("Przedział ufności dla średniej mocy (93% ufności):\n", przedzial_ufnosci, "\n")

blad <- 0.1 

n <- (1.96 * odchylenie / blad)^2
n <- ceiling(n)

cat("Minimalna wielkość próby:", n, "\n")














