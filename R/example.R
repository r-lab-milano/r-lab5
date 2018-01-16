
# read the fixed coefficients
coeff_df <- read.delim(file = "data/lookup_table.txt", header = T, sep = "\t", dec = ".")
coeff_df

# SHINY INPUT (example)
user <- list(gender = "m",
             age    = 45,
             h      = 172,
             w      = 78,
             bpmax  = 85,
             tc     = 190,
             hdl    = 48,
             smoke  = 0,
             t2d    = 0,
             hypdrug= 1)
str(user)

# function to get constants from the param table
get_cvd_k <- function(coeff_df, gender) {...}


k <- get_cvd_k(coeff_df, user$gender)

RRcvd <- function(user, k) {...}


