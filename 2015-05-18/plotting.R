extra_index <- which(data$title=="title")

if (length(extra_index)>0)
{data<- data[-extra_index, ]}
##---------------------------------

citation_NA_index <- which(is.na(data$cited.by))

if (length(citation_NA_index) > 0) 
{data [citation_NA_index, "cited.by"] <- 0}



##----------------------------------------------------
## converting to integer
data$cited.by <- as.integer(data$cited.by)
data$source.title <- as.factor(data$source.title)
##summary(data$source.title)

data$abstract_title_sum

library(lattice)
# p <- xyplot( cited.by ~ abstract_title_sum , data = data)
# print(p)

# names(data)<- names(data)[gsub(pattern = "[.]",
#                              replacement = "_", names(data))]

y<- data$cited.by
x<- data$abstract_title_sum
f<- data$source.title

xyplot(y ~ x |f, panel = function(x, y, ...) {
  panel.xyplot(x, y, ...) ## First call default panel function
  panel.lmline(x, y, col = 1) ## Overlay a simple linear regression line
})

