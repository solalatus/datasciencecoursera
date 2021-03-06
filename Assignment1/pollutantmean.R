pollutantmean <- function(directory, pollutant, id = 1:332) {
	## loop through the id vector
	for(i in id) {
		## concatenate to achieve appropriate filenames
		prefix <- ""
		if(i < 100) {
			prefix<- "0"
		}
		if(i < 10) {
			prefix<-"00"
		}
		filename <- paste(directory,"/",prefix,toString(i[1]),".csv", sep="")
		## read single monitor data
		monitordata <- read.csv(filename)
		## bind rows if possible or initialize data frame
		if(exists("dat")) {
			#print(i)
			#print("here!!")
			dat <- rbind(dat,monitordata)
		}
		else {
			dat <- monitordata
		}
	}
	##calculate the mean
	meanvalue <-mean(dat[[pollutant]], na.rm=TRUE)
	return(meanvalue)
}
