attrition.df <- read.csv("WA_Fn-UseC_-HR-Employee-Attrition.csv",header = TRUE)
head(attrition.df)
 #randomize the data
 attrition.rand <- runif(nrow(attrition.df))
attrition.randamized.df <- attrition.df[order(attrition.rand),]
head(attrition.randamized.df)
#partition the data
attrition.train <- attrition.randamized.df[1:1177,]
attrition.test <- attrition.randamized.df[1178:1471,]
#create csv files
write.csv(attrition.train,file = "Attrition_train.csv")
write.csv(attrition.test,file = "Attrition_test.csv")