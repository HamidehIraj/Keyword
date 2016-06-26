## creating a scaled target variable
data$cited.by_scaled <- scale(as.numeric(data$cited.by))


# sum(is.na(data$cited.by))
# summary(data$cited.by_scaled)
# which(is.na(data$cited.by_scaled))
# # [1]  199  399  600  796  981 1182 1383 1584 1785
# 
# data[which(is.na(data$cited.by_scaled)),c("cited.by","cited.by_scaled")]
