x<- c("a", "b", "c", "d", "e")
x
x[1]
x[c(1,5)]

Games[1:3, 6:10]

Games[c(1,10),]

Games[,c("2008","2009")]

Games[1,5]

is.matrix(Games[1,5,drop=F])

is.matrix(Games[1,drop=F])
