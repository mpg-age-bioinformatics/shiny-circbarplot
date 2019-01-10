.libPaths("/srv/shiny-server/circbarplot/libs")
library(shiny)
# Define UI for application that draws a histogram

#clusteralgs<-c("ward.D", "ward.D2", "single", "complete", "average", "mcquitty", "median", "centroid")
#distmeths<-c("euclidean", "maximum", "manhattan", "canberra", "binary" , "minkowski")

shinyUI( fluidPage(
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Choose File",
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv",
                           ".tsv",
                           ".xlsx")
      ),
      radioButtons("filetype", 'Please select the input file type', choices = c('auto' = 'auto', 
                                                                                "excel" = 'xlsx',  
                                                                                'tab-separated' = '\t', 
                                                                                'comma-seperated' = ',', 
                                                                                'semicolon-separated' = ';'), inline = TRUE),
      checkboxInput("header", "Header", TRUE),
      helpText(a(href = "https://datashare.mpcdf.mpg.de/s/vZESHmlTcAfUvCh/download", "Example input")),
      hr(),
      selectInput("group", "Select group column", choices = NULL,selected=NULL),
      selectInput("individual", "Select individual column", choices = NULL,selected=NULL),
      selectInput("values", "Select values column", choices = NULL,selected=NULL),
      hr(),
      textInput("outfile", "Output file name", value="circbarplot")
    ),
    mainPanel(
      plotOutput("circbarplot", height = '500px', width = 'auto'),
      downloadButton('downloadPlot', 'Download Plot'),
      br(), br(),
      p("This App uses the ggbiplot package. For more information read the respective documentation in",
        a("tidyverse.org", href = "https://ggplot2.tidyverse.org"),
        "."),
      p("Please keep the version tag on all downloaded files."),
      htmlOutput('appversion')
      )
  )
))
