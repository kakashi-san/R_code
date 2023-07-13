# The following code allows you
#   to compute the MLE of
#   1. the AR coefficient phi,
#   2. the unbiased estimator of v
# conditional on the first observation y1,
# for a given AR(1) set up

# import util libraries.
import::from(
    "./time_series_analysis/week_1/utils.R",
    generate_ar1_process
    )
# define config parameters here
seed <- 2021

#   config parameters for simulated AR(1) process.
n_time_pts <- 500 # number of sample data points.
phi <- 0.9 # ar coefficient
v <- 1 # innovation variance



# simulated AR 1 process data.
set.seed(seed)
std <- sqrt(v) # innovation standard deviation
sim_ar1_data <- generate_ar1_process(
    n_samples = n_time_pts,
    phi = phi,
    std = std
)

print(sim_ar1_data)