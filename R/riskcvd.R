library(dplyr)

# read in the individual values and parameters
# (if the input mask organizes the input values in a dataframe)
input <- read.delim(file = "data/input.txt", header = T, sep = "\t", dec = ".")

# read the fixed coefficients
coeff <- read.delim(file = "data/lookup_table.txt", header = T, sep = "\t", dec = ".")

# set the fixed coefficients for males
if_else(input$gender == "m", 
        coeff_cvd <- coeff %>%
          filter(disease == "cvd") %>% 
          select(coeff, male), 
        coeff_cvd <- coeff %>%
          filter(disease == "cvd") %>% 
          select(coeff, female))

# transpose coeff data to better access values
rownames(coeff_cvd) <- coeff_cvd$coeff
coeff_cvd$coeff <- NULL
coeff_cvd <- t(coeff_cvd)

# calculate the params*coefficients summary
sum <- as.numeric(coeff_cvd[,1])*input$age + as.numeric(coeff_cvd[,2])*input$bpmax + as.numeric(coeff_cvd[,3])*input$tc + as.numeric(coeff_cvd[,4])*input$hdl + as.numeric(coeff_cvd[,5])*input$smoke + as.numeric(coeff_cvd[,6])*input$t2d + as.numeric(coeff_cvd[,7])*input$hypdrug

# calculate the absolute risk RA
RA <- 1 - (as.numeric(coeff_cvd[,8])^(exp(sum - as.numeric(coeff_cvd[,9]))))

# calculate the relative risk RR
RR <- RA/0.08



