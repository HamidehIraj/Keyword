
##------------------------------------------
## creating title ratio
data$title_ratio <- 0

for (row_index in 1:nrow(data)){
  data[row_index,"title_ratio"] <- data[row_index,"title_sum"]/data[row_index,"title_length"]
}

##--------------------------------
## creating abstract ratio
data$abstract_ratio <- 0
data$abstract_sum
data$abstract_length

for (row_index in 1:nrow(data)){
  data[row_index,"abstract_ratio"] <- data[row_index,"abstract_sum"]/data[row_index,"abstract_length"]
}
##-------------------------------
## creating weight_ratio

data$weight_ratio <- 0

weight_all <- sum(key_list_df_ag$value,na.rm=TRUE) 

## These two equal
sum(key_list_df_ag$value,na.rm=TRUE) 
sum(key_list_df$value,na.rm=TRUE)


for (row_index in 1:nrow(data)){
  data[row_index,"weight_ratio"] <- data[row_index,"weight_sum"]/weight_all
}