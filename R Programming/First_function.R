## This is a comment
add2 <- function(x,y){
  x+y
}

add2(2,2)

above10 <- function(x,y = 0) {
        use <- x > y
        x[use]
}

xp <- c(10,3,5,6.7,6,100,98)
above10(xp,y = 20)

colmean <- function(y, removeNA = TRUE) {
        nc <- ncol(y)
        means <- numeric (nc)
        for(i in 1:nc) {
            means[i] <- mean(y[,i], na.rm = removeNA)
        }
        means
}
