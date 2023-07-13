source("./time_series_analysis/week_1/utils.R")
set.seed(2021)
cap_t <- 200
start_year <- 1960

t <- 1:cap_t

yt <- generate_white_noise_ts(
    cap_t = cap_t,
    start_year = start_year,
    )
#
# plot the simulated time series, their sample ACF and their sample PACF
#
par(mfrow = c(1, 3), cex.lab = 1.3, cex.main = 1.3)

plot(yt, type = 'l', col='red', xlab = 'time (t)', ylab = "Y(t)")

acf(yt, lag.max = 20, xlab = "lag",
    ylab = "Sample ACF",ylim=c(-1,1),main="")
pacf(yt, lag.max = 20,xlab = "lag",
     ylab = "Sample PACF",ylim=c(-1,1),main="")