##---THE LAW OF LARGE NUMBERS---###
#Goal - to apply statistical concepts to coding in R

#Test the Law of Large Numbers for N random normally distributed numbers with mu=0, sigma=1.
#Create an R script that will count how many of these numbers fall between -1 and 1 and divide by N.

# Generate our numbers
N=100000

x<-rnorm(N,mean=0, sd=1)

#Check the number of values between -1 and 1
y<- length(x[-1<x & x<1])

#Check whether the probability of a number falling within 1 sigma approaches E(X) as N->inf

paste("Probability of being in y is ", y/N)
Mu_X_n <- y/N




#Try and do it with a for loop - Kirill's solution
# 
# N <- 1000000 #sample size
# counter <- 0 #counter
# for (i in rnorm(N)){
#   if( i >-1 & i<1){
#     counter <- counter+1
#   }
# 
# }
# 
# answer <- counter/N
# answer



