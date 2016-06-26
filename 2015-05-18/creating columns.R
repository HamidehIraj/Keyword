
## author keywords

##adding number of keywords
data$numkeys <- 0

require(stringr,quietly=TRUE)

for (row in 1:nrow(data))
{data [row,"numkeys"] <- str_count(data[row,"author.keywords"], ";")+ 1}

##------------------------------------------------------
## splitting keywords
spl <-strsplit(as.character(data$author.keywords), ";")
keyword <- vector(mode="character", length=nrow(data))

for (key_index in 1:max(data$numkeys))
{ keyword <-cbind(keyword,sapply(spl, "[", key_index))}

## Removing extra spaces (beginning and end) from keywords  
keyword_trimmed <- gsub("(^ +)|( +$)", "", keyword)

## removing extra column
keyword_trimmed <- keyword_trimmed[,-1]

## convertig from matrix to data frame
keyword_trimmed <- as.data.frame(keyword_trimmed,stringsAsFactors=FALSE)

##-------------------------------------------------------
## adding 2 extra columns for each keyword
keyword_names  <- vector(mode="character", length=ncol(keyword_trimmed))
abstract_names <- vector(mode="character", length=ncol(keyword_trimmed))
title_names    <- vector(mode="character", length=ncol(keyword_trimmed))

## building column names
for (add_index in (1:max(data$numkeys)))
{
  if (add_index<=9){
    keyword_names[add_index]  <-paste("k0",add_index,sep = "")
    abstract_names[add_index] <- paste("k0",add_index ,"_","abstract",sep = "")
    title_names[add_index]    <- paste("k0",add_index ,"_","title",sep = "")
                   }
  
  else             {
    
    keyword_names[add_index]  <-paste("k",add_index,sep = "")
    abstract_names[add_index] <- paste("k",add_index ,"_","abstract",sep = "")
    title_names[add_index]    <- paste("k",add_index ,"_","title",sep = "")

                   }
}

names(keyword_trimmed)<- keyword_names

## creating new columns
for(newcol in c(abstract_names,title_names))
{keyword_trimmed[,newcol] <- NA}



## sorting columns
keyword_trimmed <-keyword_trimmed[,order(names(keyword_trimmed),decreasing=FALSE)]
