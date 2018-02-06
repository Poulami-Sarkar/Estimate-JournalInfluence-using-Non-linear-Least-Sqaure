data=read.csv("/home/poulami/Documents/Github/JournalInfluence/temp.csv")
x =c(data$cites)
y =c(data$influence)
z=c(data$history)
d<-data.frame(x,y,z)
#library(minpack.lm)
#b1<-min(y)
#a1<-max(y)-min(y)
#plot(x,y)

model = nls(y~a*x+b*z,data= d)
new.data <- data.frame(x=seq(min(x),max(x)),len = 100)

#model<-nls(y~a*exp(-r*x)+b*exp(r*x))
print(cor(y,predict(model)))
print(confint(model))
lines(new.data$x,new.data$z,predict(model,newdata = new.data))



      

