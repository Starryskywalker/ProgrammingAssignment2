## 1st script: test cacheSolve repeatedly
x <- matrix(rnorm(160000),400,400)
x_ <- makeCacheMatrix(x)
time1<- system.time(for (i in 1:100) {
        x__ <- cacheSolve(x_,x)})


## 2nd script: test solve repeatedly
x <- matrix(rnorm(160000),400,400)
time2<- system.time(
        for (i in 1:100) {
        x_ <- solve(x)
})

print(time1)
print(time2)

## 3rd script: verify equality
x <- matrix(rnorm(160000),400,400)
x_ <- makeCacheMatrix(x)
system.time(cacheSolve(x_,x))
print(identical(x_$getInv(),solve(x)))


## 4th script: verify equality
B = matrix(4:7,nrow=2,ncol=2)
fList <- makeCacheMatrix(B)
cacheSolve(fList,B) #1st call, this will compute the inverse
cacheSolve(fList,B) #2nd call, this will get the result from the cache
cacheSolve(fList) #3rd call, this will get the result from the cache
B = matrix(1:4,nrow=2,ncol=2) #matrix reassigned value
cacheSolve(fList,B) #4th call, this will compute the new inverse
cacheSolve(fList,B) #5th call, this will get the result from the new cache
A = matrix(rnorm(16),nrow=4,ncol=4) #matrix reassigned value and dim
cacheSolve(fList,A) #6th call, this will compute the new inverse
cacheSolve(fList,A) #7th call, this will get the result from the new cache

