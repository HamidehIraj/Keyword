df <- data.frame(V1 = c("01, 02", "04", "05, 06", "07, 08", "09", "10"),
                 V2 = c("11, 12", "14", "13, 14", "11, 14", "13", "15"))

# library(splitstackshape)
# cSplit(df, 'V1', sep=",", type.convert=FALSE)
# 
# y <- c("a_b_c", "a_b", "c_a_b")
# cSplit(as.data.table(y), "y", "_")

## splitting keywords
spl <-strsplit(as.character(data$author.keywords), ";")
keyword <- vector(mode="character", length=nrow(data))

for (key_index in 1:max(data$numkeys))
 { keyword <-cbind(keyword,sapply(spl, "[", key_index))}

## Removing extra spaces from keywords and 
keyword_trimmed <- gsub("(^ +)|( +$)", "", keyword)

## removing extra column
keyword_trimmed <- keyword_trimmed[,-1]


a <- b <- c <- d <- e <- f <- g <- 1:3
df <- data.frame(f,g,a,b,d,c,e)
sort(names(df))
sort(df,
     
df<-df[,order(names(df),decreasing=FALSE)]
