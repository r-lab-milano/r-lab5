library(dplyr)
library(tidyr)

# read the fixed coefficients
coeff_tbl <- read.delim(file = "data/lookup_table.txt", header = T, 
                       sep = "\t", dec = ".")

# clean
coeff_tbl <- coeff_tbl %>%
  filter(coeff != "mRAhyp") 

# reshape 
reshape_coeff_tbl <- function(data){
  data %>% 
    select(coeff, male, female, disease) %>%
    gather(sex, value, -coeff, -disease)
}  
coeff_tbl_long <- reshape_coeff_tbl(coeff_tbl)

# manipulate
coeff_tbl_long <- coeff_tbl_long %>%
  mutate(value = as.numeric(value))

write.csv(coeff_tbl_long, "data/coeff_table.csv")