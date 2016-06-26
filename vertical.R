key_index_comp <- grep("^k[0-9][0-9]$",  names(data))
key_index_comp

## creating the list
key_list <- c()

for (col_index in key_index_comp)
{key_list <- append(key_list,data[,col_index])}

## checking the numbers
nrow(data) * length(key_index_comp )== length(key_list)


head(key_list)
tail(key_list)

## converting the list to a dataframe
key_list_df <- as.data.frame(key_list, stringsAsFactors=FALSE)


## Filling keyword names
key_list_df$keyword_name <- NA

key_list_df[1             :(1*2145),"keyword_name"] <- "k01"
key_list_df[  ((1*2145)+1):(2*2145),"keyword_name"] <- "k02"
key_list_df[  ((2*2145)+1):(3*2145),"keyword_name"] <- "k03"
key_list_df[  ((3*2145)+1):(4*2145),"keyword_name"] <- "k04"
key_list_df[  ((4*2145)+1):(5*2145),"keyword_name"] <- "k05"
key_list_df[  ((5*2145)+1):(6*2145),"keyword_name"] <- "k06"
key_list_df[  ((6*2145)+1):(7*2145),"keyword_name"] <- "k07"
key_list_df[  ((7*2145)+1):(8*2145),"keyword_name"] <- "k08"
key_list_df[  ((8*2145)+1):(9*2145),"keyword_name"] <- "k09"
key_list_df[ ((9*2145)+1):(10*2145),"keyword_name"] <- "k10"
key_list_df[((10*2145)+1):(11*2145),"keyword_name"] <- "k11"
key_list_df[((11*2145)+1):(12*2145),"keyword_name"] <- "k12"
key_list_df[((12*2145)+1):(13*2145),"keyword_name"] <- "k13"
key_list_df[((13*2145)+1):(14*2145),"keyword_name"] <- "k14"

# summary(as.factor(key_list_df$keyword_name))
key_list_df$value <- 0

for (row_index  in 1:nrow(data))
       if (!(is.na(key_list_df[row_index,"key_list"] )))
      { key_list_df[row_index,"value"] <- 1}



str(key_list_df)

##------------------------------------------------------
## Creating the aggregate
key_list_df_ag <-   aggregate(value ~ key_list, data = key_list_df, sum)
head(key_list_df_ag)

## ordering the dataframe
key_list_df_ag <- key_list_df_ag[ order(key_list_df_ag$value,decreasing = TRUE),]
# key_list_df_ag[key_list_df_ag$value > 1,]
head(key_list_df_ag,n=20)
# tail(key_list_df_ag,n=20)

nrow(key_list_df_ag) ##3137
nrow(key_list_df_ag[key_list_df_ag$value > 1,])  ##681
nrow(key_list_df_ag[key_list_df_ag$value == 1,]) ##2456
##----------------------------------------------------



