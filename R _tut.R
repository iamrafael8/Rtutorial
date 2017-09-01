### The fundamentals of r programming 


read.csv()

load()

write.csv()

save

### ANY number entered in the console is a vector

1+2+3

c(1)==1
#c stands for combine
#[1] represents the index of the first element in the row


# There are many types of vectors

#===============

########functions 

# basic structure 

# function(arg1,arg2...){
#some code to perform a task/operation
#}

myFunc<- function(){
  print("HelloWorld")
}

myFunc()

### USING GLOBAL ENVIRONMENT 

rm(myFunc)

ls()

rm(list = ls())


### function are meant to return something

myFunc1<- function(x,y){
  return(x*y)
}
myFunc1(1,2)

myFunc2<-function(x){
  func<- function(x,y){
    return(x+y)
  }
  func(x,5)*100
}

myFunc2(1)

############ variables
a<-c(1,2,3)

b<-c(2,3,4)

a+b

a*b

2*a

vec<-c(a,b)

len<-length(vec)

vec[3:len]

####IMPORTANT TRICK

#Checking a condition and indexing

#####P1- Take those values of vec that are even

##Def Even: an integer x is called even if ??? k???Z such that x = 2k 

##use modulo to obtain result

12%%2

#leaves a remainder of 0 

##also applies componentwise to vectors 
mod2<-vec%%2

#returs a vector of remainder of the division by 2 for each compenent  
##IMPORTANT no for loops are need here whatsoever

#we need those cases where the vectors components are equal to 0

mod2==0

#returns an array of boolean values and indicate true values for each component
#that satisfies the condition

#so to go back to p1
vec[mod2==0]
#returns only the values at the indicies where the value is TRUE

#YAY we've solved it 

##this may seem basic but this a core R specific concept

x<-c(1,2,3,4,5)
x[-c(1,3)]
x<-c(1,1,1,1,2,2,2,1,1,1,3,4,5)
dist<-c(1,2,3)
x[!x%in%dist]
#
unique(x)
###########



#SPECIAL values

NA

NULL

NaN == 0/0 ## little sense values

Inf==5/0


######### 

#Coercion

vec<-as.factor(vec)

vec<- as.numeric(vec)

vec<-as.character(vec)

vec1<-c(1,0,0,1)

vec1<-factor(vec1, labels = c("A", "B"), levels = c(1,0))


####### Boolean algebra || - or ; & - and ; ! - not

(!(T||T))&T

#######Separating expressions 

x <- 1; y <- 2; z <- 3


######## High performance computing 

v <- c() 
for (i in 1:100000) {
  v[i] <- i
}

###compare 
v2 <- c(NA)
length(v2) <- 100000 
for (i in 1:100000) {
  v2[i] <- i;
} 

### Use gc() sometimes to collect garbge

gc()

###### So what are loops?

##loops enable multiple iterations 


for (i in 1:10){
  a<-paste("Step:",i)
  print(a)
}

x<-c(15,20,25)

while(x[1]%in%15){
  print(x)
 x<-x-1
}
x<-c(15,20,25)

while(x[1]<=15){
  if(x[1]==0){
    break;
    }else{
      print(x)
      x<-x-1
      print(x)
  }
}

###### lists
###### lists may include objects of differetn data types and 

#no nesed vecotrs are possible

c(c(1),2)==c(1,2)

#thus use lists

L<-list(c(1,2,3),"TRUE",F,list(c(4,5,6),17))


###### matricies 

mat <- matrix(c(1:10), nrow = 5) 

dimnames(mat) = list( 
     c("row1", "row2","row3","row4","row5"), # row names 
     c("col1", "col2")) # column names
#list indexing

dimnames(mat)[[2]]<-c("a","b")

### DataFrames

df<-data.frame(ID = 1:5,  
               Name = c("a","b","c","d","e"),
               City = c("US","Yerevan","Barcelona","PAris","Munich")) 

str(df)

nrow(df)

ncol(df)

colnames(df)

rownames(df)

df[[1]]

df$ID

head(df[1],2)

df[df$Name=="a",]

df$Name[df$Name=="a"]

df[,c(1,3)]

df[1:3,-1]

df[,"City"]

which(df$City=="Munich")

## fundamental operations:

#SELECTION

#FILTERING

#Group By (aggregation)

#JOIN Operation

###########basinc binding

df1<-data.frame(ID1 = 10:14)

binded <- cbind(df1, df)

#### Now Join Operations

authors <- data.frame(
  surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
  nationality = c("US", "Australia", "US", "UK", "Australia"),
  deceased = c("yes", rep("no", 4)))
books <- data.frame(
  name = I(c("Tukey", "Venables", "Tierney",
             "Ripley", "Ripley", "McNeil", "R Core")),
  title = c("Exploratory Data Analysis",
            "Modern Applied Statistics ...",
            "LISP-STAT",
            "Spatial Statistics", "Stochastic Simulation",
            "Interactive Data Analysis",
            "An Introduction to R"),
  other.author = c(NA, "Ripley", NA, NA, NA, NA,
                   "Venables & Smith"))

merged_inner<-merge(authors, books,
                    by.x = "surname", by.y = "name") #inner join

merged_inner<-merge(authors, books,
                    by.x = "surname", by.y = "name",all.x = TRUE) # left join

####### Group by 

data("iris")

iris

aggdata <-aggregate(iris$Sepal.Length, by=list(iris$Species), 
                    FUN=mean, na.rm=TRUE)
aggdata

###########################################


