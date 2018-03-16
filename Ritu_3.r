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
#check for missing values
library("VIM")
aggr(attrition.train)
#check for outliers
boxplot(attrition.train, main="Attrition",xlab="Variable",ylab="Value")
#outliers for monthly income
#creating lower quartile, upper quartile, interquartile range, upper hinge and lower hinge for monthly income
lowerq.attrition <- quantile(attrition.train$MonthlyIncome)[2]
upperq.attrition <- quantile(attrition.train$MonthlyIncome)[4]
iqr.attrition <- IQR(attrition.train$MonthlyIncome)
upperhinge.attrition <- upperq.attrition+(1.5*iqr.attrition)
lowerhinge.attrition <- lowerq.attrition-(1.5*iqr.attrition)
#screening for outliers in monthly income
screen.attrition <- which(attrition.train$MonthlyIncome>upperhinge.attrition|attrition.train$MonthlyIncome<lowerhinge.attrition)
#to check number of outliers in monthly income
length(screen.attrition)