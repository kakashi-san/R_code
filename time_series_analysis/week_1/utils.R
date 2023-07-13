check_even <- function(num) {
    #' checks if the integer is even or odd.
    #' @param num integer integer value to be checked for even/odd.
    #' returns TRUE if the integer is even else return FALSE.
    return(num %% 2 == 0)
}

get_euclid_q <- function(num) {
    #' write the integer in the form num = 2*q, if num is even.
    #' else num = 2*q + 1, if num is odd.
    #' and return q.
    #' @param num
    #' return @q integer.
    if (check_even(num)) {
            return(num / 2)
        } else {
            return(num - 1) / 2
            }
    }

generate_smoothing_filter <- function(period) {
    #' returns the smoothing filter for convolution given
    #' a period
    #' @param period integer
    #' return smoothing_filter array of floats with
    #' dimension 2*q + 1
    euclid_q <- get_euclid_q(period)

    return(
        1 / period * c(
            1 / 2,
            rep(1, 2 * euclid_q - 1),
            1 / 2
            )
        )
}

generate_white_noise_ts <- function(
    cap_t,
    start_year,
    mean = 0,
    std = 1,
    freq = 1
) {
    #' Define a time series object having data
    #' with no temporal structure (white noise)
    #' Assume the data correspond to
    #' annual observations.
    #' @param cap_t integer: number of observations.
    #' @param start_year positive integer: start year.
    #' @param mean float: mean value of the white noise.
    #' @param std float: standard deviation of the white noise.
    #' @param freq integer: spacing in time.

    y_white_noise <- rnorm(
        cap_t,
        mean = mean,
        sd = std
    )
    return(
        ts(
            y_white_noise,
            start = c(start_year),
            frequency = freq)
        )
}

generate_ar1_process <- function(
    n_samples,
    phi,
    std
    ) {
    #' sample n observations from an AR process
    #' with ar coefficient phi
    #' and standard deviation std.
    #' @param n_samples integer: number of observation samples
    #' @param phi float: AR coefficient
    #' @param std fload: standard deviation of the observational sample values
        return(
            arima.sim(
                n = n_samples,
                model = list(ar = phi),
                sd = std
                )
            )
    }