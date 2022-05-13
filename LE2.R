library(TSA)
library(tseries)
library(tidyverse)
library(tseries)

data <- read.csv("AAPL.csv")
data$adjPrice <- ( data$adjOpen + data$adjClose ) / 2
data <- data %>% select (c("date","adjVolume","adjPrice"))
data$date <- as.Date(data$date )

plot(data$adjPrice, type = "l")
# ACF
acf(data$adjPrice, lag.max = 31)
# PACF
pacf(data$adjPrice, lag.max = 31)
# CCF
ccf(data$adjVolume, data$adjPrice, lag.max = 31)
# EACF
eacf(data$adjPrice, ar.max = 31, ma.max = 31)

a <- arima(data$adjPrice, order = c(1, 5, 1))
predict(a)
