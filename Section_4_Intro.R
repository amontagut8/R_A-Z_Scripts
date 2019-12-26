###---INTRO---
#Goals: to investigate trends of the top 10 highest-paid basketball players over 2005-2015

#matrix()
my.data <- 1:20
my.data

A<-matrix(my.data, 4, 5)
A

B<-matrix(my.data, 4, 5, byrow=TRUE)
B

B[2,5]

#rbind()
r1 <- c("I", "am", "happy")
r2 <- c("What", "a", "day")
r3 <- c(1,2,3)

c <- rbind(r1, r2, r3)
c

rm(my.data)
rm(A)
rm(B)
rm(r1, r2, r3, c)
