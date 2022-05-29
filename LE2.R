library(TSA)
library(tseries)

data <- Nile
diffNile <- diff(data, differences=1)
adf.test(data)
adf.test(diffNile)

ss <- sunspot.year
ss <- ss[time(ss) >= 1871 & time(ss) <= 1970]
plot(ss, type = "l")
plot(log(ss), type = "l")
adf.test(ss)
adf.test(log(ss))

# ACF
acfval <- acf(diff, lag.max = 100)
acfval
# PACF
pacfval <- pacf(diff, lag.max = 100)
pacfval
# CCF
ccfval <- ccf(c(data), ss, lag.max = 10, main = "CCF")
ccfval
# EACF
eacf(diffNile, 5, 5)

