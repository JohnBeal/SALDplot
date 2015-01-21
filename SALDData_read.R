read.SALD<- function (x) {
        file_list<-list.files(pattern = "\\.dat")
        SALDdata<-lapply(file_list, read.table, sep = ":", skip = 15, 
                         col.names = c("Diameter", "Cumulative ", "Differential"))
        names(SALDdata)<-gsub("\\.dat", "", file_list)
        return(SALDdata)}

plot.SALD_h<- function (data, h, xlimit) {
        require(RColorBrewer); require(ggplot2)
        cols<-brewer.pal(12,"Set3")
        m<-ggplot(data, aes(x = Diameter, weight = Differential))
        m<-m + scale_x_continuous(limits = xlimit)
        for (i in 1:length(h)){
                m<-m + geom_density(adjust =1/h[i], color = cols[i])
        }
        m
}

plot.SALD<- function (data, h, xlimit) {
        require(RColorBrewer); require(ggplot2)
        cols<-brewer.pal(12,"Set3")
        m<-ggplot(data, aes(x = Diameter, weight = Differential))
        m<-m + scale_x_continuous(limits = xlimit)
        for (i in 1:length(h)){
                m<-m + geom_density(adjust =1/h[i], color = cols[i])
        }
        m
}

m<-ggplot(mySALD[[1]], aes(x = Diameter, weight = Differential)) 
m<-m + scale_x_continuous(limits = c(0,5))
m<-m + geom_density(adjust = 1/1, color = pcols[1])
m<-m + geom_density(adjust = 1/2, color = pcols[2])
m<-m + geom_density(adjust = 1/3, color = pcols[3])
m<-m + geom_density(adjust = 1/4, color = pcols[4])
m<-m + geom_density(adjust = 1/5, color = pcols[5])

