# Small function for correctly plotting a global map whith a rotated projection (i.e. non standard centre longitude)
## from here - https://stackoverflow.com/a/68313482
rotate_prj <- function(x, crs) {
  stopifnot(inherits(x, what = "sf"))
  stopifnot(inherits(st_crs(crs), "crs"))
  # make the data valid before doing anything else!
  x <- st_make_valid(x)
  # determine the rotated/centre longitude from crs
  lon <- sapply(strsplit(as.character(st_crs(crs)[2]), "\n"), trimws)
  lon <- lon[which(grepl(pattern = "Longitude of natural origin", x = lon))]
  lon <- as.numeric(sapply(strsplit(lon, ","),"[", 2))
  # calculate an offset
  offset <- 180 - lon
  # make a polygon that covers the centre longitude
  polygon <- st_sfc(st_polygon(x = list(rbind(
    c(-0.0001 - offset, 90),
    c(0 - offset, 90),
    c(0 - offset, -90),
    c(-0.0001 - offset, -90),
    c(-0.0001 - offset, 90)))), crs = 4326)
  # trim anything the intersect the centre longitude
  x2 <- st_difference(x, polygon)
  # project to requested crs
  x3 <- st_transform(x2, crs)
  return(x3)
}