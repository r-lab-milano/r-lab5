# FUNCTION DEFINITION

average <- function(x) {
	sum(x) / length(x)	
}

vec <- 150:300
average(vec) 








#########################
# PLANE FUNCTION
plane <- function(x, y) {
	z <- 3*x + 5*y + 2
	return(z)
}
plane(x = 2, y = 3)











### middle result
plane_2 <- function(x, y) {
	c_x <- 3
	c_y <- 5
	n   <- 2
	z <- c_x*x + c_y*y + n
	return(z)
}
plane_2(x = 2, y = 3)










###################
# PARAMETRIC FUNCTION
plane_2 <- function(c, x, y) {
	z <- c$c_x * x +  c$c_y * y +  c$n
	return(z)
}

coeff = list(c_x = 3,
						 c_y = 5,
						 n   = 2)
plane_2(c = coeff, x = 2, y = 3)















###################
# PARAMETRIC FUNCTION
plane_2 <- function(c, data) {
	z <- c$c_x * data$x +  c$c_y * data$y +  c$n
	return(z)
}

data = list(x = 2,
						y = 3)
coeff = list(c_x = 3,
						 c_y = 5,
						 n   = 2)
plane_2(c = coeff, data = data)

