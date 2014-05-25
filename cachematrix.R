## Put comments here that give an overall description of what your
## functions do
## 
## makeCacheMatrix defines a set of get and set functions that allow for
## manipulation of a passed matrix and the retreival and storage of the 
## cached inverse of the supplied matrix using cacheSolve to either produce
## and cache the inverse matrix, on the first request, or return the already 
## cached inverted matrix.  

## Write a short comment describing this function
##
##  makeCacheMatrix takes a matrix as input and defines get(getMatrix) and set(setMatrix) 
##  functions for the passed object as well as set(setMatInverse) and get(getMatInverse) functions
##  for inverting the original matrix and cacheing it and retrieving the inverted matrix, respectively. 
##  

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  setMatrix <- function(y) {
    x <<- y
    m <<- NULL
  }
  getMatrix <- function() x
  setMatInverse <- function(solve) m <<- solve
  getMatInverse <- function() m 
  list(setMatrix = setMatrix, 
       getMatrix = getMatrix, 
       setMatInverse = setMatInverse,
       getMatInverse = getMatInverse )
}


## Write a short comment describing this function
##
## This function attempts to retrieve the cached inverse matrix.  If it 
## does find the inverse matrix has been cached already it returns it.  If it has 
## not yet been cached, it will invert the matrix using the solve function, 
## Then caches it so it may be retrieved directly on subsequent calls.
## 

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getMatInverse()
  if (!is.null(m)) {
    print("getting inverted matrix")
    return(m)
  }
  regmat <- x$get()
  m <- solve(regmat)
  x$setMatInverse(m)
  m
}

