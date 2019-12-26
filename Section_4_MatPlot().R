###---MATPLOT---###

Data<- t(MinutesPlayed[1,])
Data

#Legend() and matplot() are different functions
matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4,6), pch=15:18, horiz=F)
