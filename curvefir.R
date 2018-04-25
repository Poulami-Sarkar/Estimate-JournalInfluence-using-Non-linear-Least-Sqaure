library(plot3D)
data=read.csv("/home/poulami/Documents/Github/JournalInfluence/temp.csv")
print(data)
x =c(data$current)
z =c(data$change_of_influence)
y=c(data$history)
d<-data.frame(x,y,z)
model = nls(z~a*x+b*y,data= d)
new.data <- data.frame(x=seq(min(x),max(x)),len = 100)
print("Results")
z
print(confint(model))
print(model)
year=data$year
print(cor(z,predict(model)))
print(confint(model))

## influence VS citations
plot(x,z,col="blue",xlab="citations",ylab="influence")
lines(x,predict(model),lwd=1,xlab="ciataions",ylab="influence")
open3d()
plot3d(x, year, z, col = rainbow(1000))
lines(x,year,predict(model),lwd=1,xlab="ciataions",ytab='year',zlab="influence")
#influence VS time(years)
plot(year,data$change_of_influence,lwd=2,col="purple",xlab="year",ylab="influence")
lines(year,predict(model),lwd=1)


#lines(new.data$x,new.data$z,predict(model,newdata = new.data))
plot(year,data$cites,lwd=2,col="green",xlab="year",ylab="citations")

w1 = -0.05
w2  = 0.03
b=-0.008558 
for (a in seq(from =-0.01571214, to=0.025513797,by =0.001 ))
{
  r = (b^2)-(a^2)
  if(r>0)
  {  
    r = sqrt(r)
    print(r)
    con = 1/(2*r)
    curve(con*(r+a+b)*exp(r*x)+con*(r-a-b)*exp(-r*x), -10,10,add=TRUE)
  }
}
r=-0.01571214
con = 1/(2*sqrt(r))
curve(w1*exp(0.5*x)+w2*exp(-0.5*x), -10,10,add=TRUE)

