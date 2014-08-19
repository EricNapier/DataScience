corr <- function(directory, threshold = 0)
{
	files <- list.files(directory, full.names=TRUE)
	correlations <- vector(mode = "numeric")
	for(f in files)
	{
		fileData <- read.csv(f)
		completeRecords <- fileData[complete.cases(fileData),]
		completeCount <- nrow(completeRecords)
		if (completeCount > threshold)
		{
			thisCorrelation <- cor(fileData$sulfate, fileData$nitrate, use = "complete.obs")
			correlations <- c(correlations, thisCorrelation)
		}
	}
	return (correlations)
}