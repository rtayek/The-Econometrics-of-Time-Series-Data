library(xts)
n=1000
data <- rpois(n)
dates <- seq(as.Date("2017-05-01"),length=n,by= "days")
ts <- xts(x=data, order.by=dates)
cd=coredata(ts)
ks.test(cd, "pnorm")
