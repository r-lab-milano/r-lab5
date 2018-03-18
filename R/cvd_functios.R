
library(dplyr)
library(tidyr)

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



reshape_coeff_df <- function(data){
  data %>% 
    select(coeff, male, female, disease) %>%
    gather(sex, value, -coeff, -disease)
}  

coeff_df_long <- reshape_coeff_df(coeff_df)

get_cvd_k <- function(data_long, gender) {
  data_long %>%
    filter(disease == "cvd", sex == gender) 
}

get_cvd_k(coeff_df_long, "male") 