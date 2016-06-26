## creating the backup

backup <- data


for (key_index in 1:length(keyword_names))
 for (row_index in 1:nrow(data))
   if (!(is.na(data[row_index,keyword_names[key_index]])))
     
 { data[row_index,weight_names[key_index] ] <-  
    key_list_df_ag[which(key_list_df_ag$key_list==data[row_index,keyword_names[key_index]]),"value"]  }


