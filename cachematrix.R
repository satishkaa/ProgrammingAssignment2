## Caching the inverse of matrix so that it won't be calculated every time function is called.


## The function makeCacheMatrix returns a list of functions which allows to \
##get value of matrix
##set value of matrix
##get inverse of matrix
##set inverse of matrix 

makeCacheMatrix <- function(x = matrix()) {
  
  invm <- NULL
  set <- function(y) {
    x <<- y
    #assigning the input matrix to variable created in calling function makeCacheMatrix  
    invm <<- NULL
    #initializing inverse matrix
  }
  get <- function() x
  #returns the input matrix
 
  
  setinverse <- function(inv) invm <<- inv
  #sets the inverse matrix
  
  getinverse <- function() invm
  #gets the inverse matrix
  
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  #returns the list of functions
}


## Calculating inverse if not calculated already

cacheSolve <- function(x, ...) {
  
  
  invm <- x$getinverse()
  if(!is.null(invm)) {
  
    message("getting cached data")
    return(invm)
    #inverse already present, returning the same value
  
  }
  message("calculating inverse")
  data <- x$get()
  invm <- solve(data,...)
  #calculating the inverse matrix
  
  x$setinverse(invm)
  #setting the inverse matrix so that it can be cached
  
  invm
  #returning the inverse matrix
}
