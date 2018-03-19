p <- list(weight = 79,
          height = 172,
          gender = "m",
          age    = 45,
          waist  = 80,
          glic   = 120,
          syst   = 130,
          diast  = 80,
          hdl    = 45,
          chol   = 190,
          hyp    = 1,
          hyppar = 1,
          t2dpar = 0,
          t2drel = 1,
          t2d    = 0,
          smoke  = 0,
          glicps = 0,
          sport  = 0,
          diet   = 1)

bmi_compute <- function(p){
  bmi <- p$weight/((p$height)/100)^2
  bmi
}

bmi_compute(p)


