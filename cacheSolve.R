function(x, ...) {
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