## This assignment writes a pair of functions that caches the inverse of a matrix.
## It is useful to cache because matrix inversion is usually a costly computation and
## resources can be saved through cache rather than computing it repeatedly.

## This function creates a special "matrix" object that can cache its inverse.
## From vector example, I changed name of value 'm' to 'i' in both functions
## From vector example, I changed name of values 'mean' to 'inverse' in both functions

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL                
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x          
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix 
## above.  If the inverse has already been calculated (and the matrix has not changed), then
## the cachesolve should retrieve the inverse from the cache.
## From vector example, I changed the mean() function to a solve() function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)   
        x$setinverse(i)
        i
}
