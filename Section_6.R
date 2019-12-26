#---SECTION 6---###

#Import Dataset
movies <- read.csv(file.choose())
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "Budget_Millions", "Year")

head(movies)
str(movies)
summary(movies)

##We want year to be a categorical variable. So how do we convert a numerical variable into a factor?

movies$Year <- factor(movies$Year)

#----------------------AESTHETICS
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#Add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()

#Add colour
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
  colour=Genre)) + 
  geom_point()

#Add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
       colour=Genre, size=Budget_Millions)) + geom_point()

#----------------------LAYERS & GEOMETRIES

#geom_point() needs to be added to a ggplot() object. It is a LAYER (of points) added to the plot
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                           colour=Genre, size=Budget_Millions))
#Multiple layers
p+ geom_line() + geom_point() 

#----------------------Overriding Aesthetics
p + geom_point()

q <- p

#Add a geom layer
q+geom_point()

#Overriding an aes
#Example 1
q+geom_point(aes(size=CriticRating))

#Example 2
q + geom_point(aes(colour=Budget_Millions))

#Example 3
q + geom_point(aes(x=Budget_Millions)) + xlab("Budget (Millions)")

#Example 4
q + geom_line() + geom_point()
#Reduce line size
p+ geom_line(size=1) + geom_point() 

#----------------------Mapping vs Setting

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#Add colour
#1. Mapping
r + geom_point(aes(colour=Genre))

#2. Setting
r + geom_point(colour="Green")

#We would NOT use geom_point(aes(colour="Green")). aes() is only for mapping colour to variables

r + geom_point(aes(size=Budget_Millions))

#----------------------Histograms and Density Charts

s <- ggplot(data=movies, aes(x=Budget_Millions))
s + geom_histogram(binwidth=5)

#Add colour
s + geom_histogram(binwidth=10, aes(fill=Genre))
#Add a border
s + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
#^^Chart 3^^ 

#Density Charts
s + geom_density(aes(fill=Genre), position="stack")

#----------------------Starting Layer Tips

t <- ggplot(data=movies, aes(x=AudienceRating))

t + geom_histogram(binwidth=10,
                   fill="White", colour="Blue")

#Another way

t<- ggplot(data=movies)
t + geom_histogram(aes(x=AudienceRating),
                  binwidth=10,
                  fill="White", 
                  colour="Blue")

#^^Fourth chart
t<- ggplot(data=movies)
t + geom_histogram(aes(x=CriticRating),
                  binwidth=10,
                  fill="White", 
                  colour="Blue")

#^^Fifth Chart

#----------------------Statistical Transformations

?geom_smooth()

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))

u + geom_point() + geom_smooth(fill=NA)

#boxplots

u <- ggplot(data=movies, aes(x=Genre,
                             y=AudienceRating,
                             colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)

u + geom_boxplot(size=1.2) + geom_point()
#tip/hack:
u + geom_boxplot(size=0.5) + geom_jitter()
#another way

u + geom_jitter() + geom_boxplot(alpha=0.5)
##6th Chart

#Mini Challenge: Boxplot for CRITIC RATING

u + geom_boxplot(aes(y=CriticRating)) + ylab("Critic Rating") + geom_jitter()
##ylab, xlab, and title are arguments for the ggplot function.   
  
#----------------------Using facets

v <- ggplot(data=movies, aes(x=Budget_Millions))

v + geom_histogram(binwidth = 10, aes(fill=Genre), colour="black")

#facets
v + geom_histogram(binwidth = 10, 
                   aes(fill=Genre), 
                   colour="black") + 
  facet_grid(Genre~., scales="free")

#Scatterplots
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
w + geom_point(size=3)

#facets

w + geom_point(size=0.8) + facet_grid(Genre~Year, scales="free")

w + geom_point(aes(size=Budget_Millions)) + facet_grid(Genre~Year, scales="free") + geom_smooth()
#Chart #1 

#----------------------Coordinates

#Axis limits

#Zooming on axis


m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, size=Budget_Millions, colour=Genre))

m + geom_point() + 
    xlim(50,100) + ylim(50,100)

#Wont work well always

n <- ggplot(data=movies, aes(x=Budget_Millions))
n+ geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") + coord_cartesian(ylim=c(0,50))


w + geom_point(aes(size=Budget_Millions)) + facet_grid(Genre~Year) + geom_smooth() + 
  coord_cartesian(ylim=c(0,100))

#-----------------------Adding Themes
#This is all fiddling with aesthetics (actual aesthetics)

o <- ggplot(data=movies, aes(x=Budget_Millions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

#Add a label, for example an axis label
h + xlab("Money Axis")  + 
    ylab("Number of Movies") +
    theme(axis.title.x = element_text(colour="DarkGreen", size=30),
          axis.title.y = element_text(colour="Red", size=30))


#Tick mark formatting
h + xlab("Money Axis")  + 
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))
#legend formatting

h + xlab("Money Axis")  + 
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=16),
        axis.title.y = element_text(colour="Red", size=16),
        axis.text.x = element_text(size=12),
        axis.text.y = element_text(size=12),
        legend.title = element_text(size=16),
        legend.text = element_text(size=12),
        legend.position = c(1,1),
        legend.justification = c(1,1))
#title
h + xlab("Money Axis")  + 
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=16),
        axis.title.y = element_text(colour="Red", size=16),
        axis.text.x = element_text(size=12),
        axis.text.y = element_text(size=12),
        legend.title = element_text(size=16),
        legend.text = element_text(size=12),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="Dark Blue",
                                  size=20))
  
  










