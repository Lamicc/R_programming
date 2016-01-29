## Caching the inverse of a matrix


## This function creates a list of function
# set the value of matrix, get the matrix, set the value of inverse, get the inverse

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL                   # blank matrix
        set <- function(y) {        # set a new matrix
                x <<- y
                i <<- NULL          # set a blank matrix for storing its inverse
        }
        get <- function() x         # get the matrix
        setinverse <- function(inverse) i <<- inverse     # set the value of inverse
        getinverse <- function() i                        # get inverse
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function calculates the inverse of the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)){          # return the cached result if inverse has been stored
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)     # calculate the inverse of the matrix
        x$setinverse(i)           # cache the inverse
        i
}
