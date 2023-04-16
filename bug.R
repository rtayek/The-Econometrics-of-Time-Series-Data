library(xts)
n=1000
data <- rnorm(n) #Error in rpois(n) : argument "lambda" is missing, with no default
dates <- seq(as.Date("2017-05-01"),length=n,by= "days")
ts <- xts(x=data, order.by=dates)
print(mean(ts))
prs0<-diff(ts)/lag(ts)*100
class(prs0)
str(prs0)
print(mean(prs0))
