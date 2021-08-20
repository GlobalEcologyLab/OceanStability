# small changes to rnaturalearth::ne_download
ne_download2 <- function (scale = 110, type = "countries", category = c("cultural", 
  "physical", "raster"), destdir = tempdir(), load = TRUE, 
  returnclass = "sf") {
  require(rnaturalearth)
  category <- match.arg(category)
  returnclass <- match.arg(returnclass)
  file_name <- ne_file_name(scale = scale, type = type, category = category, 
    full_url = FALSE)
  address <- ne_file_name(scale = scale, type = type, category = category, 
    full_url = TRUE)
  utils::download.file(file.path(address), zip_file <- tempfile())
  utils::unzip(zip_file, exdir = destdir)
  if (load & category == "raster") {
    rst <- raster::raster(file.path(destdir, file_name, 
      paste0(file_name, ".tif")))
    return(rst)
  }
  else if (load) {
    sp_object <- rgdal::readOGR(destdir, file_name, encoding = "UTF-8", 
      stringsAsFactors = FALSE, use_iconv = TRUE, verbose = FALSE)
    sp_object@data[sp_object@data == "-99" | sp_object@data == 
      "-099"] <- NA
    return(st_as_sf(sp_object))
  }
  else {
    return(file_name)
  }
}