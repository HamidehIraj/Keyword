names(data)

require(stringr,quietly=TRUE)

##----------------------------
## creating number of authors
data$no_authors <- 0
##sum(is.na(data$ï..authors))

for (row_index in 1:nrow(data)){
data[row_index,"no_authors"] <- str_count(data[row_index,"ï..authors"], ",")+1
}
##--------------------------------
## creating article age
data$article_age <- 0

data$year <- as.numeric(data$year)

for (row_index in 1:nrow(data)){
  data[row_index,"article_age"] <- 2016 - data[row_index,"year"]
}
##------------------------------
## creating squared age
data$article_squaredage <- 0

for (row_index in 1:nrow(data)){
  data[row_index,"article_squaredage"] <- data[row_index,"article_age"] ^ 2
}

##-----------------------------
## creating abstract length
data$abstract_length <- 0

for (row_index in 1:nrow(data)){
  data[row_index,"abstract_length"] <- 
    length(str_match_all( data[row_index,"abstract"], "\\S+" )[[1]])
}

#row_index =1
# summary(str_length(data$abstract))
# summary(data$abstract_length)
##--------------------------------
## creating title length
data$title_length <- 0

for (row_index in 1:nrow(data)){
  data[row_index,"title_length"] <- 
    length(str_match_all( data[row_index,"title"], "\\S+" )[[1]])
}

##summary(data$title_length)
##------------------------------
##creating the number of pages

data$page.start <- as.numeric(data$page.start)
data$page.end   <- as.numeric(data$page.end)

for (row_index in 1:nrow(data)){ 
  data[row_index,"no_pages"] <- 
    data[row_index,"page.count"] <- 
            data[row_index,"page.end"]-data[row_index,"page.start"]+1
}

data$page.count   <- as.numeric(data$page.count)

#data[,c("page.start","page.end","page.count")]

##--------------------------------
## creating the number of references
data$no_references <- 0

for (row_index in 1:nrow(data)){
  data[row_index,"no_references"] <- str_count(data[row_index,"references"], ";")+1
}

names(data)
summary(data$no_references)
##-------------------------------
## creating review and article variables

data$review <- 0

for (row_index in 1:nrow(data)){
  if (data[row_index,"document.type"]=="review" )   {data[row_index,"review"] <-1 }
                                      else 0
}

##data[,c("document.type","review")]
unique(data$document.type)

##------------------------------
## creating title ratio
data$title_ratio <- 0

for (row_index in 1:nrow(data)){
  data[row_index,"title_ratio"] <- data[row_index,"title_sum"]/data[row_index,"title_length"]
}

##--------------------------------
## creating abstract ratio
data$abstract_ratio <- 0

for (row_index in 1:nrow(data)){
  data[row_index,"abstract_ratio"] <- data[row_index,"abstract_sum"]/data[row_index,"abstract_length"]
}
