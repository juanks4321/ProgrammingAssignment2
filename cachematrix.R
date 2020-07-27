##makeCacheMatrix:
##This function creates a special “matrix” object that can cache its inverse.
makeCacheMatrix <- function(d = matrix()){
d <- NULL
set <- function(matrix){
x <<- y
d <<- NULL
}
get <- function()x
setresolver <- function(solve) d <<- solve
getresolver <- function() d
list(set = set,
get = get,
setresolver = setresolver,
getresolver = getresolver)
}

##cacheSolve:
##This function computes the inverse of the special “matrix” returned by makeCacheMatrix above.
##If the inverse has already been calculated, the cacheSolve retrieve the inverse from the cache.
cacheSolve <- function(x, ...){
d <- x$getresolver()
if(!is.null(d)) {
message("getting cached data")
return(d)
}
data <- x$get()
d <- solve(data, ...)
x$setresolver(d)
d
}
