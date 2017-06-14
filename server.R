library(gganimate)
library(ggplot2)
library(readr)
library(animation)

#load in the data from the download
precip_stream_data <- read_rds("D:/Duke/Work(Environ)/Programming/AcidRainStory/DataCleaning/precip_stream_data.rds")

small_data_practice <- precip_stream_data[c(1:20, 234:253, 467:486),]

Sys.setenv(PATH = paste("C:/Users/Devri/Downloads/ImageMagick-7.0.6-0-portable-Q16-x86",
                        Sys.getenv("PATH"), sep = ";"))

g <- ggplot(small_data_practice,
            aes(x = solute, y = concentration_ueq, size = MW, color = source, frame = date))+
  geom_point()

gganimate(g)
