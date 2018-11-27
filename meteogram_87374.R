rm(list=ls())

require(ggplot2)
library(reshape2)
require(meteogRam)


wk = "C:/Users/mellisos/Desktop/Programming/r/meteogram/"
setwd(wk)
# 
dd <- read.table("weather_station_87374.txt", nrows = 49 ,fill = TRUE, na.strings = c("-","---","----","-----"))

# Invierto el orde de las filas!!
df<-dd[order(nrow(dd):1),]

# df[26,]<-0

require(ggplot2)
require(reshape2)

 
 d <- data.frame(time = seq(
   from=as.POSIXct("2014-10-29 12:00", tz="UTC"),
   to=as.POSIXct("2014-10-31 12:00", tz="UTC"),
   by="hour"
 )  ,
                  "T ºC" = df$V3,
                  "Td ºC"= df$V4,
                  "Presión hPa" = df$V9,
                  "Viento km/h" = df$V8
 )
d <- melt(d,  id.vars = 'time', variable.name = 'series')




# plot on same grid, each series colored differently -- 
# good if the series have same scale
ggplot(d, aes(time,value)) + geom_line(aes(colour = series))

# or plot on different plots
ggplot(d, aes(time,value)) + geom_line(aes(colour = series)) + facet_grid(series ~ ., scales = "free_y") + labs(
  x = NULL, y = NULL, 
  title = 'Meteograma de Paraná Aero (87374)'
) 



f<- data.frame(time = seq(
  from=as.POSIXct("2014-10-29 12:00", tz="UTC"),
  to=as.POSIXct("2014-10-31 12:00", tz="UTC"),
  by="hour"
)  ,
DirecciónV = df$V7

)
f <- melt(f,  id.vars = 'time', variable.name = 'series')

#ggplot(f, aes(time,value)) + geom_point(aes(colour = series), size= 2)





# o<-as.data.frame(1:50)
# u<-data.frame(o,y$V3,y$V3,y$V4,y$V4,y$V4)
# 
# temperatures(u, plot.dewt = TRUE, plot.surf = TRUE, plot.min_max = TRUE)


# l<-scan("tplaboo.txt", character(), fill = TRUE)
# 
# u<-0
# q<-1
# for(i in 1:length(l)){
#   if("11/"==substr(l[i],start = 0, stop = 3)){
#     
#     q=q+1
#     if(q%%2==0){
#       u[q]=paste(l[i],l[i+1])
#       
#     }
#     if(u[q]==NA){
#       u[q]=u[q+1]
#     }
#      }
#  }
# 
# y$V2[26]<-NA
# 
# 
# 
# y$datetime<-as.POSIXct(paste0("2014-11-03",u), tz = "GMT")
# 
# 
# ggplot(y, aes(x= datetime, y = u)) + geom_point() + scale_x_datetime(date_labels = "%H:%M", date_breaks = "1 hour")
# 
# 
# 
# 
# 
# 
