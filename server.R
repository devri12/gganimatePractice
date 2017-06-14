library(shiny)
library(gganimate)
library(ggplot2)
library(readr)
library(animation)

#load in the data from the download
precip_stream_data <- read_rds("D:/Duke/Work(Environ)/Programming/AcidRainStory/DataCleaning/precip_stream_data.rds")

#make subsection of precip_stream_data to make quick practice gganimates
small_data_practice <- precip_stream_data[c(1:20, 234:253, 467:486, 56824:56843, 57052:57071, 57281:57300),]

#make the ImageMagick thing able to convert to produce animation... tbh got this from online
Sys.setenv(PATH = paste("C:/Users/Devri/Downloads/ImageMagick-7.0.6-0-portable-Q16-x86",
                        Sys.getenv("PATH"), sep = ";"))

function(input, output){

output$g <- renderImage({
  #online code... "a temp file to save the output, will be removed later by renderImage
  outfile <- tempfile(fileext = '.gif')
  #make animation
g <- ggplot(small_data_practice,
            aes(x = source, y = concentration_ueq, size = MW, color = solute, frame = date))+
  geom_point()

gganimate(g, "outfile.gif")

#not sure why but they say to return a list containing the filename
list(src = "outfile.gif",
     contentType = 'image/gif'
     #width = 400,
     #height = 300
     #alt = "This is alternate text"
     )}, deleteFile = TRUE)


}
