attrition.df <- read.csv("WA_Fn-UseC_-HR-Employee-Attrition.csv",header = TRUE)
head(attrition.df)
 #randomize the data
 attrition.rand <- runif(nrow(attrition.df))
attrition.randamized.df <- attrition.df[order(attrition.rand),]
head(attrition.randamized.df)
#partition the data
attrition.train <- attrition.randamized.df[1:1176,]
attrition.test <- attrition.randamized.df[1177:1470,]
#create csv files
write.csv(attrition.train,file = "Attrition_train_new.csv")
write.csv(attrition.test,file = "Attrition_test_new.csv")
write.csv(attrition.randamized.df,file = "Attrition_randamizedfulldata.csv")