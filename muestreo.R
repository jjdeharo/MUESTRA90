# MUESTRA90
# Al vector x debe pasarse las frecuencias absolutas o relativas de cada especie

muestreo <- function(x,PX=0.1,d=4) {
  x <- sort(x)
  M <- length(x) # Número de especies
  i <- 1:M
  xi <- log(x)
  y <- lm(xi~i)
  print(summary(y))
  W <- exp(y [[1]][2])
  names (W) <- ""
  
  cat("Error Tipo I =",PX,"\n\nW=",W,"\n")
  
  cat("\nPrimera hipótesis: Número de especies por recolectar elevado\n")
  P <- 1/W ^ M 
  PX0<- (1 - P) ^ sum(x)
  
  
  cat("\nP =",P,"\nP(x0) =",PX0,"(probabilidad de que queden más especies)")
  
  
  X <- round(log(PX, 1 - P)) # Ejemplares suplementarios
  
  if (PX0 <= PX) {
    cat("\nHipótesis rechazada\n")
  } else {
    cat("\nEjemplares suplementarios=",X - sum(x),"\n")
  }
  
  
  
  # Segunda hipótesis
  
  
  P1 <- (W - 1) / (W ^ (M +1) - 1)
  PX1 <- (1 - P1) ^ sum(x)
  X1 <- round(log(PX, 1 - P1))
  
  
  
  if(PX0 <= PX) {
    cat("\n\n\nSegunda hipótesis: Una especie por recolectar\n")
    cat("\nP1 =",P1,"\nP'(x0) =",PX1,"(probabilidad de que quede otra especie)\n")
    if(PX1 <= PX) {
      cat("Hipótesis rechazada\n\n**Muestreo terminado**\n")
    } else {
      
      cat("\nEjemplares suplementarios:",X1 - sum(x),"\n")
      
    }
  }
  
  
  hip1 <- c (round (P,d), round (PX0,d), X)
  names (hip1) <- c ("P","PX0", "X")
  hip2 <- c (round (P1,d), round (PX1,d), X1)
  names (hip2) <- c ("P1","PX1","X1")
  res <- list (PX=PX,W=W, Hip1=hip1, Hip =hip2)
  return(res)
}

#x <- c(1,2,3,4,5,6,7)
x <- c(166,42,27,23,2767,9,477,85,4,131,48)
a<-muestreo(x,0.05)