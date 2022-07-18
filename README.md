# Faster ocean warming threatens richest areas of marine biodiversity

This folder can be used to recreate the analysis and plots in:

Brown, S. C., Mellin, C., García Molinos, J., Lorenzen, E. D., & Fordham, D. A. (2022). Faster ocean warming threatens richest areas of marine biodiversity. *Global Change Biology*, 00, 1– 10. [https://doi.org/10.1111/gcb.16328](https://doi.org/10.1111/gcb.16328)

Code is archived at Zenodo - [![DOI](https://zenodo.org/badge/508904203.svg)](https://zenodo.org/badge/latestdoi/508904203)

To use, simply unzip the folder to your desired location, and then double click on the OceanStability.Rproj file to open the RStudio project. There are two datasets that need to be sourced before you can recreate the analysis.

[*StableClim*](https://doi.org/10.1038/s41597-020-00663-3): Data available from https://doi.org/10.25909/5ea59831121bc

and 

[*Marine Biogeographic realms*](https://doi.org/10.1038/s41467-017-01121-2): Shapefile available from https://doi.org/10.17608/k6.auckland.5596840.v1

You can then open the Rmarkdown files in RStudio. The files are in `Code/`, e.g. `Code/01_StableClimExtract.Rmd` will recreate the first part of the analysis which extracts the climate data from StableClim.

You will need to edit some paths present in the files to get them to work properly. 

For example, in 01_StableClimExtract.Rmd, changes need to be made on the following lines:

Line 56: `scPath <- "/mnt/c/StableClim"`, change this to the location of the *StableClim* data

In 02_sppRichness.Rmd, the location of the marine biogeographic realms needs to be changed:

Line 62: `regions <- read_sf("/mnt/c/Shapes/MarineRealmsShapeFile/MarineRealms.shp")`, change this to the location where you have extracted the realms.

You can then either [knit the documents](https://rmarkdown.rstudio.com/articles_intro.html) or run through them [interactively](https://bookdown.org/yihui/rmarkdown/notebook.html#executing-code)
