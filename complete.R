complete <- function(directory, id = 1:332){
        temp = list.files(path = directory ,pattern="*.csv")
        complete_nobs <- data.frame(id = numeric(), nobs = numeric())
        for (i in id){
                pol_file <- read.csv(paste(directory,temp[i],sep = "/"))
                strp_file <- na.omit(pol_file)
                total_nobs <- nrow(strp_file)
                complete_nobs <- rbind(complete_nobs, data.frame(id=i,nobs=total_nobs))
        } 
        complete_nobs
}