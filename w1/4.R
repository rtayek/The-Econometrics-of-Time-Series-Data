library(moments)
library(haven)
library(xts)
library("dplyr")
library(fitdistrplus)
library(logspline)#install.packages("ggplot2")
library(ggplot2)
library(forecast)
pn <- function(format="", ...) { # print
    cat(sprintf(fmt=format,...))
}
pr <- function(format="", ...) { # priint line
    pn(format,...)
    cat("\n")
}
stats<-function(ts){
    m=mean(ts); sd<-sd(ts); ku<-kurtosis(ts); sk<-skewness(ts)
    pr("mean: %f, sd: %f, kurtosis: %f, skewness %f",m,sd,ku,sk)
}
filename<-"w1/week 4 data.dta"; path<-file.path(filename); df <- read_dta(path)
ts<-xts(x=df$sp500,order.by = df$date)
head(ts,n=3)
stats(ts)
plot(ts)
pr<-diff(ts)/lag(ts)*100
head(pr,n=3)
pr<-pr[-1,] # remove first
head(pr,n=3)
plot(pr)
qqnorm(ts, pch = 1, frame = FALSE)
qqline(ts, col = "steelblue", lwd = 2)
# check abs and ^2
library("ggpubr")
ggdensity(pr,main = "density",xlab = "% return")
curve(dnorm(x, 0, 1), from=-4, to=4)
m=mean(pr)
sd=sd(pr)
x0<-m-4*sd; x1<-m+4*sd
print(m)
print(sd)
curve(dnorm(x, m, sd), from=x0, to=x1, bty="n", xlab="")#plot(x)
fit <- auto.arima(pr)
#shapiro.test(pr$sp500)
#descdist(ts$sp500, discrete = FALSE)
