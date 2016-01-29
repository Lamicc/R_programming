# makeVector() creates a special "vector", which is really a list containing a function to

# set the value of the vector
# get the value of the vector
# set the value of the mean
# get the value of the mean

makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

# cachemean() calculates the mean of the special "vector" created with the above function


cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}

## example:
# newvector <- makeVector(1:50)
# cachemean(newvector)

# [1] 25.5

## second call:
# cachemean(newvector)

# getting cached data
# [1] 25.5