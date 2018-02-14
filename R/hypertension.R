library(readr)
library(dplyr)

params <- read_delim('data/lookup_table.txt', 
                     delim = '\t',
                     col_types = cols_only(coeff = col_character(),
                                      male = col_double(),
                                      female = col_double(),
                                      disease = col_factor(levels = NULL))
)

user <- read_delim('data/input.txt', delim = '\t') %>% 
  as.list()

calc_BMI <- function(weight, heigth) {
  weight / (heigth / 100)
}

user$hypfam = 1


risk_hypertension <- function(params, user) {
  
  user$gender <- if_else(user$gender == 'm', 0, 1) 
  
  user$bmi <- user$w / (user$h / 100)^2
  user$age_bpmin <- user$bmi * user$bpmin
  
  params <- params[which(params$disease == 'hyp'), 'male']
  
  params$shiny_names <- c('age', 'gender', 'bmi', 'bpmax', 'bpmin', 'smoke', 'hypfam','age_bpmin', 'S', 'I')

  I <- params[params$shiny_names == 'I', 'male']
  S <- params[params$shiny_names == 'S', 'male']
  
  data.frame(rowname = names(user), user = t(as.data.frame(user)) %>% 
               inner_join(params, by = c('shiny_names' = 'rowname'))
  
  hyp <- 1 - exp(-exp((log(4) - ( I + sum(params$male * data.frame(rowname = names(user), user = t(as.data.frame(user))), na.rm = TRUE))) / S))
  
  }
