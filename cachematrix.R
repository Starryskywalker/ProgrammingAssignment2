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

cacheSolve <- function(x, z = x$get(),...) {
        ## 'x' is the special 'matrix' returned by makeCacheMatrix
        ## 'z' is the real matrix used when calling makeCacheMatrix, defualt is 
        ## the matrix cached in 'x'
        
        ## Checks if the inverse of matrix 'z' in makeCacheMatrix is already  
        ## calculated, AND the matrix 'z' stays the same
        ## if yes, caches the inverse
        Inv <- x$getInv()
        Mtx <- x$get()
        if(!is.null(Inv) & identical(Mtx,z)) {
                message("getting cached data")
                return(Inv)
        } else {
                ## Calculates, stores in cache, and returns a matrix that is the inverse of
                ## 'z', and flushes 'x' with new matrix 'z' value
                x$set(z)
                data<- x$get()
                Inv <- solve(data, ...)
                x$setInv(Inv)
                x$getInv()
        }
        
}
