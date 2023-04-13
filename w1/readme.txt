gamma is covariance coeddicients?
tau is correlation coefficients

https://www.coursera.org/learn/the-econometrics-of-time-series-data/supplement/65VMC/from-the-theoretical-acf-to-the-specification-of-the-empirical-model

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
