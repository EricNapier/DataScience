complete <- function(directory, id = 1:332)
{
	files <- list.files(directory, full.names=TRUE)
	result <- data.frame()
	nobs <- vector()
	for (i in id)
	{
		dat <- read.csv(files[i])
		goodRecords <- dat[complete.cases(dat),]

		nobs <- c(nobs, nrow(goodRecords))
	}
	result <- data.frame(id, nobs)
	result
}