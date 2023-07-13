# to be incorporated in a config file
source("./time_series_analysis/week_1/utils.R")

# Load the CO2 dataset in R
data(co2)

# generate smooting filter with a given period
smoothing_filter <- generate_smoothing_filter(
    period = 12 # TODO make a config file for period
    )

# Take first differences to remove the trend.
co2_1stdiff <- diff(co2, differences = 1)

# Filter via moving averages to remove the seasonality
co2_ma <- filter(
    x = co2,
    filter = smoothing_filter,
    sides = 2
    )

par(
    mfrow = c(3, 1),
    cex.lab = 1.2,
    cex.main = 1.2
    )

# plot the original data.
plot(co2)

# plot the first differences (removes trend, highlights seasonality).
plot(co2_1stdiff)

# plot the filtered series via
plot(co2_ma)
