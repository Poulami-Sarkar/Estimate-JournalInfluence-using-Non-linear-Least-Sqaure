x<-seq(2014,2015,2016)
y<-seq(1.64,1.959,2.008)
library(minpack.lm)
model<-nls(y~a*exp(-r*x)+b*exp(r*x))
cor(y,predict(model))

