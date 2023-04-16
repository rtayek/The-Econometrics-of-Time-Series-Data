library(ggplot2)
n=1000
data <- rnorm(n) #Error in rpois(n) : argument "lambda" is missing, with no default
dates <- seq(as.Date("2017-05-01"),length=n,by= "days")
ts <- xts(x=data, order.by=dates)
plot(ts)
ggplot(ts)
autoplot(ts)
ggplot(ts, aes(x = Index, y =data)) + 
    geom_line() +
    labs(x = "Date", y = "Value")
str(ts)
