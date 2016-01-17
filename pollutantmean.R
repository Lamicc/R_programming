pollutantmean <- function(directory,pollutant,id = 1:332){
        
        temp = list.files(path = directory ,pattern="*.csv")
        if(pollutant =="sulfate"){
                sul_sum <- 0
                mon_sum <- 0
                for (i in id){
                        pol_file <- read.csv(paste(directory,temp[i],sep = "/"),colClasses = c('NULL','numeric','NULL','NULL'))
                        strp_file <- na.omit(pol_file)
                        sul_sum <- sul_sum + sum(strp_file)
                        mon_sum <- mon_sum + nrow(strp_file)
                } 
                sul_sum/mon_sum
        }
        else{
                ni_sum <- 0
                mon_sum <- 0
                for (i in id){
                        pol_file <- read.csv(paste(directory,temp[i],sep = "/"),colClasses = c('NULL','NULL','numeric','NULL'))
                        strp_file <- na.omit(pol_file)
                        ni_sum <- ni_sum + sum(strp_file)
                        mon_sum <- mon_sum + nrow(strp_file)
                } 
                ni_sum/mon_sum
        }
}