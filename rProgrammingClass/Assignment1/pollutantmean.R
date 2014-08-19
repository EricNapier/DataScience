pollutantmean <- function(directory, pollutant, id = 1:332)
{
	totalList <- vector()
	for (i in id)
	{
		fname = i
		if (i < 10)
		{
			fname = paste("00", fname, sep="")
		}
		else if (i < 100)
		{
			fname = paste("0", fname, sep="")
		}

		fname = paste(directory, fname, sep="/")
		fname = paste(fname, "csv", sep=".")	
		records <- read.csv(fname)

		p <- records[pollutant]
		bad <- is.na(p)
		totalList <- c(p[!bad], totalList)
	}

	mean(totalList)
}