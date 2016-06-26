## creating a list of variables to sum over
abstract_all_string <- names(data)[grep("k*_abstract",names(data))]
title_all_string    <- names(data)[grep("k*_title",names(data))]
weight_all_string    <- names(data)[grep("k*_weight",names(data))]

## adding sum variables
data$abstract_sum       <- NA
data$title_sum        	<- NA
data$abstract_title_sum <- NA
data$weight_sum         <- NA

data$abstract_sum        <- apply(data[,abstract_all_string]          ,1,sum,na.rm=TRUE)
data$title_sum           <- apply(data[,title_all_string]             ,1,sum,na.rm=TRUE)
data$abstract_title_sum  <- apply(data[,c("abstract_sum","title_sum")],1,sum,na.rm=TRUE)
data$weight_sum          <- apply(data[,weight_all_string]            ,1,sum,na.rm=TRUE)


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

