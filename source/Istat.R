# modified from ENMEval
Istat <- function(predictors, overlapStat) {
  require(raster); require(dismo)
  dnames <- names(predictors)
  if (class(predictors) == "SpatRaster") {
    predictors <- as(predictors, "Raster")
  }
  n <- raster::nlayers(predictors)
  ov <- matrix(nrow = n, ncol = n)
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      ov[j, i] <- dismo::nicheOverlap(predictors[[i]], predictors[[j]], stat = overlapStat)
    }
  }
  colnames(ov) <- dnames
  rownames(ov) <- dnames
  return(ov)
}
