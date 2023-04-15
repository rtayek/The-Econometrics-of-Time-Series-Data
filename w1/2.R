library(readxl)
library(SciViews)
library(pracma)
library(ggplot2)
library(ggpubr)
ilename<-"w1\\week 2 data.csv"
print(filename)
path=file.path(filename)
print(path)
print(file.exists(path))
df <- as.data.frame(read.csv(path))

#### First ####
###### Transform the data into ln ######
df$lnJapan <- ln(df$Japan)
df$lnUS <- ln(df$US)

###### Detrend the two series you have created ######
df$lnJapan_d <- detrend(df$lnJapan)
df$lnUS_d <- detrend(df$lnUS)

###### Estimate an MA(1) model ######
MA1_Japan <- arima(df$lnJapan_d, order = c(0,0,1))
MA1_US <- arima(df$lnUS_d, order = c(0,0,1))
MA1_Japan
MA1_US

###### Estimate an AR(1) model ######
AR1_Japan <- arima(df$lnJapan_d, order = c(1,0,0))
AR1_US <- arima(df$lnUS_d, order = c(1,0,0))
AR1_Japan
AR1_US

###### Estimate an AR(2) model ######
AR2_Japan <- arima(df$lnJapan_d, order = c(2,0,0))
AR2_US <- arima(df$lnUS_d, order = c(2,0,0))
AR2_Japan
AR2_US

###### Estimate an ARMA(1,1) model ######
ARMA_Japan <- arima(df$lnJapan_d, order = c(1,0,1))
ARMA_US <- arima(df$lnUS_d, order = c(1,0,1))
ARMA_Japan
ARMA_US

#### Second ####
###### Transform the data into ln ######
df$lnJapan <- ln(df$Japan)
df$lnUS <- ln(df$US)

###### Detrend the two series you have created ######
df$lnJapan_d <- detrend(df$lnJapan)
df$lnUS_d <- detrend(df$lnUS)

###### Estimate an MA(1) model and plot the acf function of residuals ######
MA1_Japan <- arima(df$lnJapan_d, order = c(0,0,1))
MA1_Japan_r <- residuals(MA1_Japan)
acf(MA1_Japan_r)

MA1_US <- arima(df$lnUS_d, order = c(0,0,1))
MA1_US_r <- residuals(MA1_US)
acf(MA1_US_r)

###### Estimate an AR(1) model and plot the acf function of residuals ######
AR1_Japan <- arima(df$lnJapan_d, order = c(1,0,0))
AR1_Japan_r <- residuals(AR1_Japan)
acf(AR1_Japan_r)

AR1_US <- arima(df$lnUS_d, order = c(1,0,0))
AR1_US_r <- residuals(AR1_US)
acf(AR1_US_r)

###### Estimate an AR(2) model and plot the acf function of residuals ######
AR2_Japan <- arima(df$lnJapan_d, order = c(2,0,0))
AR2_Japan_r <- residuals(AR2_Japan)
acf(AR2_Japan_r)

AR2_US <- arima(df$lnUS_d, order = c(2,0,0))
AR2_US_r <- residuals(AR2_US)
acf(AR2_US_r)

###### Estimate an ARMA(1,1) model and plot the acf function of residuals ######
ARMA_Japan <- arima(df$lnJapan_d, order = c(1,0,1))
ARMA_Japan_r <- residuals(ARMA_Japan)
acf(ARMA_Japan_r)

ARMA_US <- arima(df$lnUS_d, order = c(1,0,1))
ARMA_US_r <- residuals(ARMA_US)
acf(ARMA_US_r)

##### Third #####
##### Generate three series for R each of the following equations #####
# 1
y1 <- rnorm(1, mean=0, sd=1)
e <- rnorm(1, mean=0, sd=1)
for(i in c(2:500)){
    e[i] <- rnorm(1, mean=0, sd=1)
    y1[i] <- y1[i-1] + e[i]
}

# 2
mu <- rnorm(1, mean=0, sd=1)
y2 <- y1[1]
for(i in c(2:500)){
    y2[i] <- mu + y2[i-1] + e[i]
}

# creat a dataframe
n <- 1:500
dfy <- data.frame(n, y1, y2, e)

##### Plot the series using the data provided #####
plot(y1, type="l")
plot(y2, type="l")
plot(e, type="l")

# plot together
p1 <- ggplot(dfy) +
    geom_line(aes(x = n, y = y1)) +
    theme_minimal() +
    theme_bw() +
    theme(panel.grid =element_blank())

p2 <- ggplot(dfy) +
    geom_line(aes(x = n, y = y2)) +
    theme_minimal() +
    theme_bw() +
    theme(panel.grid =element_blank())

p3 <- ggplot(dfy) +
    geom_line(aes(x = n, y = e)) +
    theme_minimal() +
    theme_bw() +
    theme(panel.grid =element_blank())

ggarrange(p1,p2,p3,ncol=1,nrow=3,labels=c("y1","y2","e"))
