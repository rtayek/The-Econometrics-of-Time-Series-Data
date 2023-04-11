#### Exercise 1.4 ####
##### plot 1 #####
noise <- rnorm(500, mean=0, sd=1)
n <- 1:500
white_noise <- data.frame(n,noise)
plot(white_noise$n, white_noise$noise, type = "l")

##### plot 2 #####
white_noise$determinic <- 0.5 + 0.02 * white_noise$n + white_noise$noise
plot(white_noise$n, white_noise$determinic , type = "l")

##### plot 3 #####
white_noise$stochastic[1] <- 0
for(i in c(2:500)){
    white_noise$stochastic[i] <- rnorm(1, mean=0, sd=1) + white_noise$stochastic[i-1]
}
plot(white_noise$n, white_noise$stochastic , type = "l")


##### install package #####

install.packages("ggplot2")
library(ggplot2)

##### plot Exercise 1 #####
ggplot(white_noise) +
    geom_line(aes(x = n, y = noise, color = "noise")) +
    geom_line(aes(x = n, y = determinic, color = "determinic")) +
    geom_line(aes(x = n, y = stochastic, color = "stochastic")) +
    theme_minimal() +
    theme_bw() +
    theme(panel.grid =element_blank())


#### Exercise 2.4 ####
install.packages("pracma")
library(pracma)

##### plot 1 #####
white_noise$noise_d <- detrend(white_noise$noise)
plot(white_noise$n, white_noise$noise_d, type = "l")

##### plot 2 #####
white_noise$determinic_d <- detrend(white_noise$determinic)
plot(white_noise$n, white_noise$determinic_d, type = "l")

##### plot 3 #####
white_noise$stochastic_d <- detrend(white_noise$stochastic)
plot(white_noise$n, white_noise$stochastic_d, type = "l")

##### plot Exercise 2 #####
# noise_d and determinic_d are overlapped
ggplot(white_noise) +
    geom_line(aes(x = n, y = noise_d, color = "noise_d")) +
    geom_line(aes(x = n, y = determinic_d, color = "determinic_d")) +
    geom_line(aes(x = n, y = stochastic_d, color = "stochastic_d")) +
    theme_minimal() +
    theme_bw() +
    theme(panel.grid =element_blank())


#### Exercise 4.3 ####
install.packages("SciViews")

library(readxl)
library(SciViews)
library(pracma)
filename<-"w1\\Week 1 Data.csv"
print(filename)
path=file.path(filename)
print(path)
print(file.exists(path))
df <- as.data.frame(read.csv(path))
#df <- as.data.frame(read_excel("C:\\Ph.D\\datajapanus.xlsx"))

# Transform the data into ln
df$lnJapan <- ln(df$Japan)
df$lnUS <- ln(df$US)

# Detrend the two series
df$lnJapan_d <- detrend(df$lnJapan)
df$lnUS_d <- detrend(df$lnUS)

# estimate ACF
acf(df$lnJapan_d, plot = F)
acf(df$lnUS_d, plot = F)

# plot ACF
acf(df$lnJapan_d)
acf(df$lnUS_d)

# estimate pACF
pacf(df$lnJapan_d, plot = F)
pacf(df$lnUS_d, plot = F)

# plot pACF
pacf(df$lnJapan_d)
pacf(df$lnUS_d)

