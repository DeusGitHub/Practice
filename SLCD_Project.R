install.packages("stats")
install.packages("dplyr")
install.packages("randomForestSRC")
install.packages("CRAN")


library(stats)
library(dplyr)
library(randomForestSRC)
library(tree)

Bankruptcy<-read.csv("C:\\Users\\91790\\Desktop\\Bankruptcy Prediction\\bankruptcy_Train.csv (1)\\bankruptcy_Train.csv")

View(Bankruptcy)


#Variable Selection
str(Bankruptcy)



#Splitting Data in Training and Testing

index=sample(2,nrow(Bankruptcy),replace = TRUE,prob = c(0.7,0.3))

##Training data
train=Bankruptcy[index==1,]

##Testing data
test=Bankruptcy[index==2,]

#Tree Model

tree_Bankruptcy=tree(train$class~., data=train, split="deviance", control=tree.control(nobs=nrow(train), mincut = 5, minsize = 10, mindev=0.01))

