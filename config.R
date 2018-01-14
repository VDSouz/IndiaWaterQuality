# File 1:R-Script 
# contains a loop that iteratively calls an Rmarkdown file (i.e. File 2)

# load packages
library(knitr)
library(markdown)
library(rmarkdown)
library(readxl)

#Load Water Quality Data File
data <- read.csv("C:/Users/vanes/Documents/Report/waterqualitydata.csv")

# remove NA
row.has.na <- apply(data, 1, function(x){any(is.na(x))})
sum(row.has.na)
final_data <- data[!row.has.na,]
head(final_data)
data <- final_data

# for each type of state in the data - created a report
# these reports are saved in output_dir with the name specified by output_file
for (state in unique(data$STATE)){
  
  if (state == "ANDHRA PRADESH" ||    state ==  "ASSAM" || state == "GOA" || state == "HIMACHAL PRADESH" || state == "KERALA" || state == "MAHARASHTRA" || state == "ODISHA" || state == "RAJASTHAN" || state == "UTTAR PRADESH" || state == "WEST BENGAL")
  rmarkdown::render('C:/Users/vanes/Documents/Report/State-wise.Rmd',  # file 2
                    output_file =  paste("report_", state, '_', Sys.Date(), ".html", sep=''), 
                    output_dir = 'C:/Users/vanes/Documents/Report/States')
  
}

