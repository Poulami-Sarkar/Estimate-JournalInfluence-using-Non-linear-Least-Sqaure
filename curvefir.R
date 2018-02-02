x<-c(2014,2015,2016)
y<-c(1.64,1.959,2.008)
data<-data.frame(x,y)
library(minpack.lm)
b1<-min(y)
a1<-max(y)-min(y)
plot(x,y)

model = nls(y~a*exp(r*x)+b*exp(-r*x),data= data, start=list(a=min(y),b=max(y)-min(y),r=sqrt(b1^2-a1^2)))

#model<-nls(y~a*exp(-r*x)+b*exp(r*x))
#cor(y,predict(model))


