## papers that don't belong to computers and education
wrong_title <- c("interdependencies between the science and technology infrastructure and innovation activities in german regions: empirical findings and policy consequences",
"territorial concentration and evolution of science and technology activities in the european union: a descriptive analysis",
"the efficacy of different modes of funding research: perspectives from australian data on the biological sciences",
"in search of the european paradox: an international comparison of europe's scientific performance and knowledge flows in information and communication technologies research"
)

wrong_title_index <- which(data$title %in% wrong_title)

if  (length(wrong_title_index)>0)
{data <- data[-wrong_title_index,]}


