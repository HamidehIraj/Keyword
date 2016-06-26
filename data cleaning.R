

## converting column names to lower case
names(data) <- tolower(names(data))
##---------------------------------------------------

## converting data to lower case
require(dplyr,quietly=TRUE)
data <- mutate_each(data, funs(tolower))

##---------------------------------------------------

extra_quotation_index2 <-which(data$source.title=="history of education" &
                data$volume==40 & data$issue==3 & data$page.start==315)

# data[extra_quotation_index2,c("abstract","abstract_length")]
if (length(extra_quotation_index2)> 0)
{
  data$abstract <- sapply(data$abstract, 
                                 function(x){gsub(pattern = "aimã©",
                                                  replacement = "aime", x)})
}
##------------------------------------------------
cite_index <- grep("citã©",data$abstract)

data[cite_index,"abstract"]
if (length(cite_index)> 0)
{
  data$abstract <- sapply(data$abstract, 
                          function(x){gsub(pattern = "citã©",
                                           replacement = "cite", x)})}
##-------------------------------------------------
fosse_index <- grep("(â€˜fossã© moralâ€™, â€˜rã¶stigrabenâ€™)",data$abstract)
if (length(fosse_index )> 0)
{
  data$abstract <- sapply(data$abstract, 
                          function(x){gsub(pattern = "(â€˜fossã© moralâ€™, â€˜rã¶stigrabenâ€™)",
                                           replacement = "(fosse moral,rostigraben)", x)})}
##--------------------------------------------------
##---------------------------------------------------
## filling citation variable
#data$cited.by
citation_NA_index <- which(is.na(data$cited.by))

if (length(citation_NA_index) > 0) 
   {data [citation_NA_index, "cited.by"] <- 0}
##---------------------------------------------------

## no abstract available
abs_index <- grep ("no abstract available",data$abstract) ## rows to delete

if (length(abs_index)>0)
  {data <- data[-abs_index, ]}

##---------------------------------------------------

## no keywords
key_index <- which(is.na(data$author.keywords)) ## rows to delete
key_index

if  (length(key_index)>0)
   {data <- data[-key_index, ]}
##---------------------------------------------------

## no references
ref_index <- which(is.na(data$references)) ## rows to delete
if  (length(ref_index)>0)
{data <- data[-ref_index, ]}

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
note_index <- which(data$references=="note") ## rows to retain
if  (length(note_index)>0)
{data <- data[-note_index, ]}

##---------------------------------------------------
## Replacing dot, colon and semicolon with nothing in abstract

dot_index <- grep (".",data$abstract) ## rows to update
data$abstract <- sapply(data$abstract, 
                               function(x){gsub(pattern = "[.]",
                                                replacement = "", x)})

comma_index <- grep (",",data$abstract) ##  rows to update
data$abstract <- sapply(data$abstract, 
                        function(x){gsub(pattern = ",",
                                         replacement = "", x)})

semicolon_index <- grep(";",data$abstract) ## rows to update
data$abstract <- sapply(data$abstract, 
                        function(x){gsub(pattern = ";",
                                         replacement = "", x)})

colon_index <-grep(":",data$abstract) ##  rows to update
data$abstract <- sapply(data$abstract, 
                        function(x){gsub(pattern = ":",
                                         replacement = "", x)})

left_paranthesis<- grep("[(]",data$abstract) ##  rows to update
data$abstract <- sapply(data$abstract, 
                        function(x){gsub(pattern = "[(]",
                                         replacement = "", x)})

right_paranthesis<- grep("[)]",data$abstract) ##  rows to update
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

wrong_end2<- which(data$title=="the game object model and expansive learning: creation, instantiation, expansion,and re-representation")
data[wrong_end2,"page.end"] <- 98

wrong_end3 <- which(data$title=="beyond online discussions: extending the community of inquiry framework to entire courses")
data[wrong_end3,"page.end"] <- 69
##--------------------------------------------------
## correcting wrong page start

wrong_start <- grep("rural, suburban, and urban schools: the impact of school setting onthe efficacy beliefs and attributions of student teachers",
                    data$title)
data[wrong_start,"page.start"]<-104
data[wrong_start,"page.end"]  <-114

wrong_start2 <- grep("once hired, seldom gone",data$title)
data[wrong_start2,"page.start"]<- 108

##-----------------------------------------
data$page.start <- as.numeric(data$page.start)
data$page.end   <- as.numeric(data$page.end)

data[wrong_end,"page.count"] <- data[wrong_end,"page.end"]-data[wrong_end,"page.start"]+1
##--------------------------------------------------
empty_page_start <- grep("a changed context of lifelong learning under the influence of migration: south korea",
                         data$title)
data[empty_page_start,"page.start"] <- 255
data[empty_page_start,"page.end"]   <- 272

##--------------------------------------------------

# copyright <- grep("©.*",data$abstract) ##  rows to update
# 
# data$abstract <- sapply(data$abstract, 
#                         function(x){gsub(pattern = "©.*",
#                                          replacement = " ", x ) }  )

## incorrect keywords
incorrect_key_index <- which(data$author.keywords=="computer error learn software classification cognitive expert novice")
data[incorrect_key_index,"author.keywords"] <-
  "computer error; learn software; classification cognitive; expert; novice"

##-----------------------------------------------
##remove extra rows
extra_index <- which(data$title=="title")

if (length(extra_index)>0)
{data<- data[-extra_index, ]}