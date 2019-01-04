.libPaths("/srv/shiny-server/circbarplot/libs")

if(!require(futile.logger)){
  install.packages("futile.logger", dependencies = TRUE)
  library(futile.logger)
}

if(!require(xlsx)){
  install.packages("xlsx", dependencies = TRUE)
  library(xlsx)
}

if(!require(tidyverse)){
  install.packages("tidyverse", dependencies = TRUE)
  library(tidyverse)
}

quit(save="no")

# https://www.r-graph-gallery.com/297-circular-barplot-with-groups/
