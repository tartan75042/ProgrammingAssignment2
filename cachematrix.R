## This assignment writes a pair of functions that caches the inverse of a matrix.
## It is useful to cache because matrix inversion is usually a costly computation and
## resources can be saved through cache rather than computing it repeatedly.

## This function creates a special "matrix" object that can cache its inverse.
## From vector example, I changed name of value 'm' to 'i' in both functions
## From vector example, I changed name of values 'mean' to 'inverse' in both functions

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL                ## restores variable to null, since the old 
                                 ## inverse of the old matrix is no longer needed
                set <- function(y) {    ## set() changes the vector x stored in the 
                                        ## main function
                x <<- y                  
                i <<- NULL
        }
        get <- function() x      ## get() returns the vector x stored in main function
        setinverse <- function(inverse) i <<- inverse   ## setinverse() stores the value
                                                        ## of the argument in a variable 
                                                        ## called i for the main function        
        getinverse <- function() i     ## returns the variable i
        list(set = set, get = get,    ## stores the 4 previous functions into a list
             setinverse = setinverse,
             getinverse = getinverse)     
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix 
## above.  If the inverse has already been calculated (and the matrix has not changed), then
## the cachesolve should retrieve the inverse from the cache.
## From vector example, I changed the mean() function to a solve() function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()      ## retrieve any previous inverses and store in i
        if(!is.null(i)) {        ## if i not null then return cached value, else continue
                message("getting cached data")
                return(i)
        }
        data <- x$get()         ## get the matrix value from makeCacheMatrix, store in 'data'
        i <- solve(data, ...)        ## calculate the inverse of the matrix, store in 'i'
        x$setinverse(i)          ## store the inverse back in makeCacheMatrix function
        i                            ## print the inverse of the matrix
}
