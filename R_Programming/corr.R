corr <- function(directory, threshold = 0){
        id <- 1:332
        num_comp <- complete(directory,id)
        #print(head(num_comp))
        corrs <- c()
        for (i in 1:length(num_comp[["nobs"]])){
                nobs = num_comp[[i,"nobs"]]
                id = num_comp[[i,"id"]]
                #print(nobs)
                #print(id)
                if (nobs > threshold){
                        if(id < 10){ 
                                number <- paste('00', i, sep='')
                        }else if (id >= 10 && i< 100){
                                number <- paste('0', i, sep='')
                        }else{
                                number <- paste(i, sep='')
                        }
                        file_path <- paste(directory,"/", number, '.csv', sep = '')
                        temp <- read.csv(file_path) 
                        temp <- temp[complete.cases(temp),]
                        # print(head(temp,20))
                        sulf <- temp["sulfate"]
                        nit <- temp["nitrate"]
                        # I want the correlation between the COMPLETE rows, not all rows...
                        # sulf_nona <- sulf[!is.na(sulf)]
                        # nit_nona <- sulf[!is.na(nit)]
                        corrs <- append(corrs,cor(sulf,nit))
                }
        }
        corrs
}