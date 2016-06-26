##remove extra rows
extra_index <- which(data$title=="title")

if (length(extra_index)>0)
    {data<- data[-extra_index, ]}
##--------------------------------------------------
year_index <- (which(!(data$year>0)))
##--------------------------------------------------

## converting column names to lower case
names(data) <- tolower(names(data))
##---------------------------------------------------

## converting data to lower case
require(dplyr,quietly=TRUE)
data <- mutate_each(data, funs(tolower))

##---------------------------------------------------

## filling citation variable
#data$cited.by
citation_NA_index <- which(is.na(data$cited.by))

if (length(citation_NA_index) > 0) 
   {data [citation_NA_index, "cited.by"] <- 0}
##---------------------------------------------------

## no abstract available
abs_index <- grep ("no abstract available",data$abstract) ##2 rows to delete

if (length(abs_index)>0)
  {data <- data[-abs_index, ]}

##---------------------------------------------------

## no keywords
key_index <- which(is.na(data$author.keywords)) ##82 rows to delete
key_index

if  (length(key_index)>0)
   {data <- data[-key_index, ]}


##---------------------------------------------------
## replacing comma with semi-colon in author keywords
## for facilitating the analysis

comma_index <-  grep (",",data$author.keywords) ##  rows to update

if (length(comma_index)> 0)
{
  data$author.keywords <- sapply(data$author.keywords, 
                        function(x){gsub(pattern = ",",
                                         replacement = ";", x)})
}
##---------------------------------------------------
year_index <- which(data$year>0) ##198 rows to retain
data <- data[year_index, ]

##---------------------------------------------------
## Replacing dot, colon and semicolon with nothing in abstract

dot_index <- grep (".",data$abstract) ##198 rows to update
data$abstract <- sapply(data$abstract, 
                               function(x){gsub(pattern = "[.]",
                                                replacement = "", x)})

comma_index <- grep (",",data$abstract) ## 196 rows to update
data$abstract <- sapply(data$abstract, 
                        function(x){gsub(pattern = ",",
                                         replacement = "", x)})

semicolon_index <- grep(";",data$abstract) ##35 rows to update
data$abstract <- sapply(data$abstract, 
                        function(x){gsub(pattern = ";",
                                         replacement = "", x)})

colon_index <-grep(":",data$abstract) ## 60 rows to update
data$abstract <- sapply(data$abstract, 
                        function(x){gsub(pattern = ":",
                                         replacement = "", x)})

left_paranthesis<- grep("[(]",data$abstract) ## 146 rows to update
data$abstract <- sapply(data$abstract, 
                        function(x){gsub(pattern = "[(]",
                                         replacement = "", x)})

right_paranthesis<- grep("[)]",data$abstract) ## 147 rows to update
data$abstract <- sapply(data$abstract, 
                        function(x){gsub(pattern = "[)]",
                                         replacement = "", x)})
# x<- "a(b"
# x<- gsub(pattern = "[(]",replacement = "", x   ) 

wrong_semicolon <- grep("(tpck; tpack)",data$author.keywords)

if (length(wrong_semicolon)>0)
{  data$author.keywords <- sapply(data$author.keywords, 
                                  function(x){gsub(pattern = "(tpck; tpack)",
                                                   replacement = "(tpck tpack)", x)})}

wrong_keyword <- grep("; s; ",data$author.keywords)
if (length(wrong_keyword)>0)
{  data$author.keywords <- sapply(data$author.keywords, 
                                  function(x){gsub(pattern = "; s; ",
                                                   replacement = ";", x)})}
 
wrong_keyword2 <- grep("^c; ",data$author.keywords)


if (length(wrong_keyword2)>0)
{  data$author.keywords <- sapply(data$author.keywords, 
                                  function(x){gsub(pattern = "^c; ",
                                                   replacement = "", x)})}

wrong_keyword3 <- grep("[(]atf",data$author.keywords)

{  data$author.keywords <- sapply(data$author.keywords, 
                                  function(x){gsub(pattern = "[(]atf",
                                                   replacement = "", x)})}

 wrong_keyword4 <- grep(" [(]cm",data$author.keywords)
{  data$author.keywords <- sapply(data$author.keywords, 
                                  function(x){gsub(pattern = " [(]cm",
                                                   replacement = "", x)})}

wrong_keyword5 <- grep("communicationc[)]",data$author.keywords)
{  data$author.keywords <- sapply(data$author.keywords, 
                                  function(x){gsub(pattern = "communicationc[)]",
                                                   replacement = "communication", x)})}

wrong_keyword6 <- grep("communicationsc[)]",data$author.keywords)
{  data$author.keywords <- sapply(data$author.keywords, 
                                  function(x){gsub(pattern = "communicationsc[)]",
                                                   replacement = "communications", x)})}
 

 wrong_keyword7 <- grep(" [(]hud",data$author.keywords)
{  data$author.keywords <- sapply(data$author.keywords, 
                                  function(x){gsub(pattern = " [(]hud",
                                                   replacement = "", x)})}
 

wrong_keyword7 <- grep("trainingt[)]",data$author.keywords)
{  data$author.keywords <- sapply(data$author.keywords, 
                                  function(x){gsub(pattern = "trainingt[)]",
                                                   replacement = "training", x)})}

# wrong_keyword8 <- grep("(second/foreign language)",data$author.keywords)
# data <- data[-wrong_keyword8,]


wrong_abstract <- grep("\"chinese\" \"americans\" and \"japanese\"",data$abstract)
{  data$abstract <- sapply(data$abstract, 
                                  function(x){gsub(pattern = "\"chinese\" \"americans\" and \"japanese\"",
                                                   replacement = "chinese americans and japanese", x)})}


##--------------------------------------------------
## correcting wrong page end
wrong_end <- grep("developing a collaborative model of research using digital video",
                  data$title)
data[wrong_end,"page.end"] <- 347

data$page.start <- as.numeric(data$page.start)
data$page.end   <- as.numeric(data$page.end)

data[wrong_end,"page.count"] <- data[wrong_end,"page.end"]-data[wrong_end,"page.start"]+1

##--------------------------------------------------

head(data$abstract)
copyright <- grep("©.*",data$abstract) ## 2116 rows to update

data$abstract <- sapply(data$abstract, 
                        function(x){gsub(pattern = "©.*",
                                         replacement = " ", x)})


