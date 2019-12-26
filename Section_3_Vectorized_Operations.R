###VECTORIZED OPERATIONS AND THEIR POWER

x <- rnorm(5)
x

#R-specific programming loop
#Specific because x is a vector
for(i in x){
  print(i)
  
}

#Conventional programming loop
for(j in 1:5){
  print(x[j])
}
#---------------------------------------------------
#Vectorized vs de-vectorized operations
N <- 100000
a <- rnorm(N)
b <- rnorm(N)

#Vectorized approach. Faster in R
#Acting as a wrapper here

c <- a * b


#De-vectorized approach

d <- rep(NA,N)
for(i in 1:N){
  d[i] = a[i] * b[i]
}








