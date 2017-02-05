
#Setup the environment by loading libraries, downloading source archive, extracting data files and loading data into data.frames.

#clear workspace of prior objects to free memory.
rm(list = ls())

#function to install and load libraries that are not already installed or loaded
#using very cool approach found here https://gist.github.com/stevenworthington/3178163
ipak <- function(pkg){
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if (length(new.pkg))
        install.packages(new.pkg, dependencies = TRUE)
    sapply(pkg, require, character.only = TRUE)
}

print(paste("started at :", Sys.time()))

print("loading libraries.")
#create vector of libraries and pass into the above function.
libraries <- c("data.table","dtplyr","dplyr","readr","ggplot2", "RcolorBrewer")
ipak(libraries)

#remove the objects since they will not be used again this session
rm("libraries","ipak")

#check for data folder.  Create one if none exists
home_dir <- getwd()
data_dir <- file.path(home_dir,"data")
if (!dir.exists(data_dir)) { dir.create(data_dir)}
setwd(data_dir)

#Source archive and data files
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
sourcezip <- "FNEI_data.zip"
sourcefilenames <- c("summarySCC_PM25.rds","Source_Classification_Code.rds")

#check if file has already been downloaded.  If it does not exist, then download it.
if (!file.exists(file.path(data_dir,sourcezip))) {
    print("downloading data archive.")
    download.file(url, destfile = sourcezip, method = "libcurl")
} else {
    print("Archive already exists locally.")
}

#check if source data files are already unzipped
if (!all(file.exists(sourcefilenames))) {
    print("unzipping data files")
    unzip(sourcezip, sourcefilenames, list = FALSE, junkpaths = TRUE, exdir = data_dir, unzip = "internal")
} else {
    print("source data files previously unzipped")
}

#load source data files
NEI <- readRDS(file.path(data_dir,"summarySCC_PM25.rds"))
SCC <- readRDS(file.path(data_dir,"Source_Classification_Code.rds"))

setwd(home_dir)

#str(NEI)
#str(SCC)
