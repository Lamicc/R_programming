corr <- function(directory, threshold = 0){
        temp = list.files(path = directory ,pattern="*.csv")
        comp_cases <- complete(directory,1:332)
        valid_cases <- subset(comp_cases, nobs > threshold)
        ids <- as.vector(valid_cases[['id']])
        a_cor <- numeric()
        for(i in ids){
                pol_file <- read.csv(paste(directory,temp[i],sep = "/"))
                strp_file <- na.omit(pol_file)
                new_cor <- cor(strp_file['sulfate'],strp_file['nitrate'])
                a_cor <- c(a_cor, new_cor)
        }
        a_cor
}