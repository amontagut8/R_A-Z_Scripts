#Named Vectors

Charlie <- 1:5

#give names
names(Charlie) <- c("a", "b", "c", "d", "e")
Charlie
Charlie["d"]

#clear names
names(Charlie) <- NULL

#Naming matrix dimensions 1
temp.vec <- rep(c("a", "b", "zZ"), each=3)
temp.vec

Bravo <- matrix(temp.vec, nrow=3, ncol=3)
Bravo

rownames(Bravo) <- c("How", "are", "you")
Bravo

colnames(Bravo) <- c("X", "Y", "Z")
Bravo

Bravo["are", "Y"]=0
Bravo

##Set rownames()/colnames() to NULL to drop names