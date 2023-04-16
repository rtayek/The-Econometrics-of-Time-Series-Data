m=1; sd=1
curve(dnorm(x, m, sd), from=-5, to=5, bty="n", xlab="")
m=1; sd=4
curve(dnorm(x, m, sd), from=-5, to=5, bty="n", xlab="")
p9 <- ggplot(data.frame(x = c(-4, 4)), aes(x = x)) +
    stat_function(fun = dnorm, args = list(m, sd))
p9
