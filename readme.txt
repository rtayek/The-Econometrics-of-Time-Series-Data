gamma is covariance coeddicients?
tau is correlation coefficients

auto correlation formula is different for time series because it gives better results.

use simulation to show smaple distribution of the mean.

outliers maybe are like very unusual event?

would leave one out x validation lead you to discoover a better model?

https://stats.stackexchange.com/questions/520841/when-a-time-series-is-considered-overdifferenced

https://www.researchgate.net/publication/332621968_Over-Differencing_and_Forecasting_with_Non-Stationary_Time_Series_Data

correlate with 2 delta or
    d1>0 && d2>0 prdict up for a while?
    d1<0 && d2<0 predict down for a while?
    
https://stats.stackexchange.com/questions/520841/when-a-time-series-is-considered-overdifferenced    

this folder has all of the source for the course.
it also has stuf from fpp3.

http://adv-r.had.co.nz/Computing-on-the-language.html

https://stackoverflow.com/questions/7705345/how-can-i-extract-plot-axes-ranges-for-a-ggplot2-object

https://tidyverts.github.io/tidy-forecasting-principles/

http://rstudio-pubs-static.s3.amazonaws.com/292878_39d4c7baccf0458ba0c0e39bdceb76b3.html

https://www.coursera.org/courses?query=fintech
https://www.udemy.com/topic/fintech/

https://www.coursera.org/learn/the-econometrics-of-time-series-data/supplement/65VMC/from-the-theoretical-acf-to-the-specification-of-the-empirical-model

https://stackoverflow.com/questions/6675066/ggplots-qplot-does-not-execute-on-sourcing

https://www.youtube.com/watch?v=dBNy_A6Zpcc

A white noise process has:
    a zero acf after lag 0
    a zero partial acf after lag 0

An autoregressive process has:
    a geometrically decaying acf
    number of spikes of partial acf = AR order

A moving average process has:
    number of spikes of acf = MA order
    a geometrically decaying partial acf 

The ARMA process has:
    a geometrically decaying acf 
    a geometrically decaying partial acf

ma(1) model
y=-0.5u(t-1)+u(t)
acf--> 0 auite rapidly and 1 spike
pacf --> 0 suite smoothly

ma(2) model
y=.5i(t-1)-.25u(t-2)+u(t)
acf--> 0 quickly and 2 spikes
pacf --> 0 smooothly and oscillates

ar(1) model
y=.9y(t-1)


