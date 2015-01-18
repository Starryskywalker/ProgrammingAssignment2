## Below are two functions that are used to create a special object that stores
## a matrix and caches its inverse.

## The first function, makeCacheMatrix creates a special "matrix" object, which
## is actually a list containing a function to

## set the value of the matrix
## get the value of the matrix
## set the value of the inverse of given matrix
## get the value of the inverse of given matrix

## This created "matrix" object caches its inverse for future use

makeCacheMatrix <- function(x = matrix()) {
        Inv <- NULL
        set <- function(y) {
                x <<- y
                Inv <<- NULL
        }
        get <- function() x
        setInv <- function(solve) Inv <<- solve
        getInv <- function() Inv
        list(set = set, get = get,
             setInv = setInv,
             getInv = getInv)

}


## The second function computes the inverse of the special "matrix" returned by
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then the cacheSolve should retrieve the inverse 
## from the cache

cacheSolve <- function(x, ...) {
        ## Checks if the inverse of matrix 'x' in makeCacheMatrix is already  
        ## calculated, if yes, cache the inverse
        Inv <- x$getInv()
        if(!is.null(Inv)) {
                message("getting cached data")
                return(Inv)
        }
        data <- x$get()
        Inv <- solve(data, ...)
        x$setInv(Inv)
        Inv
        ## If not, calculate, store in cache, and return a matrix that is the 
        ## inverse of 'x' 
}
