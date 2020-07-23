complete <- function(directory, id = 1:332){
  nobs <- c()
  for (i in id){
    if(i < 10){
      number <- paste('00', i, sep='')
    }else if (i >= 10 && i< 100){
      number <- paste('0', i, sep='')
    }else{
      number <- paste(i, sep='')
    }
    # could have done this with the complete.cases function!
    file_path <- paste(directory,"/", number, '.csv', sep = '')
    temp <- read.csv(file_path)
    rs <- rowSums(!is.na(temp))
    num <- sum(rs[rs==4])/4
    nobs <- append(nobs,num)
  }
  num_rows <- data.frame(id,nobs)
  num_rows
}