# Record of all devtools:: made to create this package

devtools::create(".")
devtools::use_package("assertthat")
devtools::use_data_raw()
devtools::use_package("readxl")
devtools::use_package("prenoms")
devtools::use_package("ggplot2")
devtools::use_package("dplyr")
devtools::use_package("tidyr")
devtools::use_data(prenoms)
devtools::use_vignette("MyownpackageX2017")
devtools::use_package("ggthemes")
devtools::build_vignettes()

