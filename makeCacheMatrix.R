function(x = matrix(data = NA, nrow = 1, ncol = 1 )) {
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