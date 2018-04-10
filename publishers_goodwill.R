library(plot3D)
data=read.csv("/home/poulami/Documents/Github/JournalInfluence/dataFiles/final_publisher.csv")
print(data)
plot(data$year,data$articles,lwd=2,col="green",xlab="year",ylab="no of issues")
x<-data$year

library(plot3D)
data=read.csv("/home/poulami/Documents/Github/JournalInfluence/dataFiles/new.csv")
print(data)
x =c(data$current)
z =c(data$change_of_influence)
y=c(data$history)
ed=c(data$editor)
pub=c(data$articles)
d<-data.frame(x,y,z,ed,pub)
model = nls(y~exp(x)+exp(-x),data= d)
y<-data$articles
d<-data.frame(x,y)
model = nls(y~a*exp(-b*x),data= d)
print(cor(z,predict(model)))
print(confint(model))
lines(x,predict(model),lwd=1)


