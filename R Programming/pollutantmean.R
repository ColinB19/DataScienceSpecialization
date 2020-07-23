pollutantmean <- function(directory, pollutant, id = 1:332){
  num = 0
  dem = 0
  for (i in id){
    if(i < 10){
      number <- paste('00', i, sep='')
    }else if (i >= 10 && i< 100){
      number <- paste('0', i, sep='')
    }else{
      number <- paste(i, sep='')
    }
    file_path <- paste(directory,"/", number, '.csv', sep = '')
    temp <- read.csv(file_path)
    pol <- temp[pollutant]
    num <- num +sum(pol[!is.na(pol)])
    dem <- dem + sum(!is.na(pol))
  }
  num/dem
}