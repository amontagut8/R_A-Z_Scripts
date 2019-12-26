###---CREATING A FUNCTION---###


myplot <- function(data, rows){
  Data<- t(data[rows,,drop=F])
  
  
  #Legend() and matplot() are different functions
  matplot(Data, type="b", pch=15:18, col=c(1:4,6))
  legend("top", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
  
}

myplot(Salary, 1:3)
