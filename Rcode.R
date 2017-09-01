
###Try to reproduce python histogram
set.seed(2017)
dn<-rnorm(10000)



hist_data<-as.data.frame(dn)
library(ggplot2)

ggplot(hist_data, aes(x=dn))+geom_histogram(binwidth = 0.2, aes(fill=I("#009b7e"), color=I("black")))


ggplot(hist_data, aes(x=dn))+
  geom_histogram(binwidth = 0.2, aes(fill=I("#009b7e"), color=I("black")))+
geom_freqpoly(binwidth = 0.2,linetype = "dashed",color=I("red"))+theme_light()

p
ggsave(p, file="plot.pdf")

##### some stuff on diamonds
data("diamonds")

library(plotly)
p<-ggplot(diamonds, aes(x=cut,y=carat))+
      geom_bar(stat = "identity",
               aes(fill=color),position = "dodge")
p


ggplot(diamonds, aes(x=carat,y=price))+
  geom_point(aes(shape=cut), alpha=I(0.05))+geom_smooth(method = lm, se=F)+ 
  coord_cartesian(xlim = c(0, 3), ylim = c(0, 20000))
data("mtcars")

p<-ggplot(mtcars, aes(x=wt,y=mpg))+
  geom_point(aes(size=wt, color=hp))+theme(legend.position = "bottom")+
  scale_color_gradient()+geom_smooth(method=lm, se=F)

p
ggplotly(p)

plot_ly(z = ~ volcano, type = "surface")

library(plotly)
ggplotly(p)

