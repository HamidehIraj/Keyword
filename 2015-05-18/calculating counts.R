## appending keyword_trimmed to data
data <- as.data.frame(cbind(as.matrix(data),keyword_trimmed,stringsAsFactors=FALSE),
                       colclasses="string",stringsAsFactors=FALSE)

str(data)
require(stringr,quietly=TRUE)

# for (var_index in 1:max(data$numkeys))
#   for (row_index in 1:nrow(data)){
# 
#   variable_string <- paste("k",var_index,sep="")
#   
#   ## for making strcount posssible.
#   data[,variable_string] <- as.character(data[,variable_string])
#   
#   abstarct_string <- paste("k",var_index,"_","abstract",sep="")
#   title_string    <- paste("k",var_index,"_","title",sep="")
#   
#   
#   data[row_index,abstarct_string] <- 
#        str_count(data[row_index,"abstract"], data[row_index,variable_string])
#   
#   data[row_index,title_string] <- 
#        str_count(data[row_index,"title"], data[row_index,variable_string])
# }

#count_index=1
# keyword_names[count_index]
# abstract_names[count_index]
# title_names[count_index] 

 for (count_index in 1:length(keyword_names))
   for (row_index in 1: nrow(data))
 {
     if (!(is.na(data[row_index,keyword_names[count_index]])))
     {
   data[row_index,abstract_names[count_index]] <- 
            str_count(data[row_index,"abstract"], data[row_index,keyword_names[count_index]])
   
   data[row_index,title_names[count_index] ] <- 
            str_count(data[row_index,"title"], data[row_index,keyword_names[count_index]])
     }
     else {data[row_index,abstract_names[count_index]] <- 0;
     
     data[row_index,title_names[count_index] ] <- 0 }
 }

!(is.na(data[row_index,keyword_names[count_index]]))


abstract_all_string <- names(data)[grep("k*_abstract",names(data))]
title_all_string    <- names(data)[grep("k*_title",names(data))]

##adding sum variables
data$abstract_sum       <- NA
data$title_sum        	 <- NA
data$abstract_title_sum <- NA

data$abstract_sum <- apply(data[,abstract_all_string],1,sum,na.rm=TRUE)
data$title_sum    <- apply(data[,title_all_string],1,sum,na.rm=TRUE)
data$abstract_title_sum <- apply(data[,c("abstract_sum","title_sum")],1,sum,na.rm=TRUE)


#write.csv(data,"data.csv")

# count_index
# row_index
# # # # 
data[row_index,c("author.keywords")]
summary(as.numeric(data$numkeys))
dim(keyword_trimmed)
keyword_trimmed[row_index,]
# 
# write.csv(keyword_trimmed,"keyword_trimmed.csv")
# class(keyword_trimmed)
# 
# 
row_index
count_index

str_count(data[row_index,"abstract"], data[row_index,keyword_names[count_index]])
str_count(data[row_index,"title"], data[row_index,keyword_names[count_index]])

data[row_index,"abstract"]
data[row_index,"numkeys"]

keyword_names[2]
