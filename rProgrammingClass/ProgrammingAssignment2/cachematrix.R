##This is a pair of functions implementing the assignment 2 instructions.
##Specifically, they create a matrix whose inverse is cacheable.

##Create a matrix object with a cacheable inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  
  #Assemble and return a list of functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


##Return the inverse of matrix x. Look it up in the cache if possible.
##If not, compute it and cache it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)){
    message("getting cached inverse")
    return(i)
  }
  
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
