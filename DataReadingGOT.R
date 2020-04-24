# Read the data and convert it to matrix from. 
# Manage the names of characters in correct order.
# originalData - original data
# oD.smoothed - data used for fitting model
# oD.1 - first 2 books, used for validation
# oD.2 - first 3 books, used for validation
# character.names -- vector of names of characters for labelling plots.


gotData <- read.table("got_data.txt", header=T, stringsAsFactors=F)
# Arrange the character names in correct order
character.names <- gotData[,1]
character.names[6] <- "Jon Snow"
character.names[22] <- "Jon C"
character.names[21] <- "Quentyn"
character.names[23] <- "Melisandre"
character.names[24] <- "Barristan"

gotData <- as.matrix(gotData[,-c(1,7)])
gotData <- matrix(as.numeric(gotData), nr=nrow(gotData))
originalData <- gotData

# Split the data of books 4 and 5
oDs45 <- originalData
oDs45[,4] <- (originalData[,4]+originalData[,5])*sum(originalData[,4])/sum(originalData[,4:5])
oDs45[,5] <- (originalData[,4]+originalData[,5])*sum(originalData[,5])/sum(originalData[,4:5])

# Combine the data of books 4 and 5
oDc45 <- originalData[,1:4]
oDc45[,4] <- originalData[,4]+originalData[,5]

# Smoooth data for model fitting
oD.smoothed <- oDs45
# Combine the data for model fitting
oD.combined <- oDc45

# Create data for validation
oD.1 <- originalData[1:9, 1:2]
oD.2 <- originalData[1:12, 1:3]
