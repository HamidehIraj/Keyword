

source("loading data.R") 
source("data cleaning.R")
source("data cleaning-2.R")
source("creating columns.R")
source("calculating counts.R")
source("vertical.R")
source("calculating weights.R")
source("calculating sums.R")
source("creating predictors.R")
source("creating targets.R")
source("calculating ratios.R")
source("writing data.R")


summary(data$abstract_length)
summary(data$year)

data[10,"abstract"]
data[which(data$page.count==2 ),c("title","page.start","page.end"),]

sort(unique(data$page.count))

