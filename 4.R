library(moments)
library(haven)
library(ggpubr)
library(nortsTest)
library(xts)
library(dplyr)
library(fitdistrplus)
library(logspline)
library(ggplot2)
library(forecast)
require(graphics)
require(dgof)
source("pr.R")
myStats<-function(ts){
    m=mean(ts); sd<-sd(ts); ku<-kurtosis(ts); sk<-skewness(ts)
    p("mean: %.2f, sd: %.2f, kurtosis: %.2f, skewness %.2f",m,sd,ku,sk)
}
analyze<-function(ts) {
    ggplot(ts, aes(x = Index, y =data)) + 
        geom_line() +
        labs(x = "Date", y = "Value")
    #head(ts,n=3)
    myStats(ts)
    #str(ts)
    qqnorm(ts, pch = 1, frame = FALSE)
    qqline(ts, col = "steelblue", lwd = 2)
    #lobato.test(ts) # where 
    #shapiro.test(cd)#ks.test(cd, "pnorm")
    nortest::ad.test(coredata(ts))
    ggdensity(ts,main = "density",xlab = "% return")
    
}
filename<-"week4.dta"; path<-file.path(filename); df <- read_dta(path)
ts<-xts(x=df$sp500,order.by = df$date)
n=1000
data <- rnorm(n) #Error in rpois(n) : argument "lambda" is missing, with no default
dates <- seq(as.Date("2017-05-01"),length=n,by= "days")
#ts <- xts(x=data, order.by=dates)
analyze(ts)
pl=plot(ts)
ggdensity(ts,main = "density",xlab = "sp500")
prs0<-diff(ts)/lag(ts)*100
prs<-prs0[-1,] # remove first (NA)
analyze(prs)
# check abs and ^2
p1=ggdensity(prs,main = "density",xlab = "% return")
#curve(dnorm(x, 0, 1), from=-4, to=4)
m=mean(prs)
sd=sd(prs)
x0<-m-4*sd; x1<-m+4*sd
x0=-20; x1=20 # range of density plot
print(x0)
print(x1)
curve(dnorm(x, m, sd), from=x0, to=x1, bty="n", xlab="")
curve(dnorm(x, m, sd), xlim=c(x0,x1), bty="n", xlab="") # used to work
curve(dnorm(x, m, sd), xlim=c(x0,x1), ylim=c(0,1), bty="n", xlab="")
curve(dnorm(x, 2, 1), from=1, to=7, bty="n", xlab="")
fit <- auto.arima(prs)
#descdist(ts$sp500, discrete = FALSE)
