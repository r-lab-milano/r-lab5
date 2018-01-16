
# read the fixed coefficients
coeff_df <- read.delim(file = "data/lookup_table.txt", header = T, sep = "\t", dec = ".")
coeff_df

# SHINY INPUT (example)
user <- list(gender = "male",
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

user_female <- list(gender = "female",
             age    = 45,
             h      = 172,
             w      = 78,
             bpmax  = 85,
             tc     = 190,
             hdl    = 48,
             smoke  = 0,
             t2d    = 0,
             hypdrug= 1)

# function to get constants from the param table
get_cvd_k <- function(coeff_df, gender) {
  coeff_df[coeff_df$disease=="ob", gender]
}


k <- get_cvd_k(coeff_df, user_female$gender)

RRover <- function(user, k) {
  RAover_25 <- k[1]
  RAover_30 <- k[2]
  bmi_value = bmi(user$w, user$h)
  
  if (bmi_value <= 25) {
    return (RAover_25)
  } else if (bmi_value > 25 && bmi_value < 30) {
    return (RAover_30)
  }
  
}

RRobesity <- function(user, k) {
  RAob_25 <- k[3]
  RAob_30 <- k[4]
  bmi_value = bmi(user$w, user$h)
  
  if (bmi_value <= 25) {
    return (RAob_25) # 
  } else if (bmi_value > 25 && bmi_value < 30) {
    return (RAob_30)
  }
  
}

bmi <- function (w, h) {
  return (w / (h*2))
}

