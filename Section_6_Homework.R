###---SECTION 6 HOMEWORK---###

#Using a new dataset, recreate chart:
###Boxplot with jitter, genre on x, gross % US, jitters are ordered by size and coloured by studio
#ONLY INCLUDING the following genres: action, adventure, animation, comedy, drama
#AND the following studios: Buena Vista Studios, Fox, Paramount Pictures, Sony, Universal, WB

#read data

homework_dataset <- read.csv(file.choose())

##Filter our dataset. Do it in two steps
#Filter for Genre

dataset_filtered <- homework_dataset[(homework_dataset$Genre == 'action' )| 
                                      (homework_dataset$Genre == 'adventure') | 
                                      (homework_dataset$Genre == 'animation') |
                                      (homework_dataset$Genre == 'comedy' )|
                                      (homework_dataset$Genre == 'drama'),]


#Filter for Studio
dataset_filtered <- dataset_filtered[(dataset_filtered$Studio == 'Buena Vista Studios')|
                                     (dataset_filtered$Studio == 'Fox')|
                                     (dataset_filtered$Studio == 'Paramount Pictures') | 
                                     (dataset_filtered$Studio =='Sony') | 
                                     (dataset_filtered$Studio =='Universal') | 
                                     (dataset_filtered$Studio =='WB'),]

#Check to make sure everything is right
write.csv(dataset_filtered, file="Filtered_Dataset.csv")

##Interesting. It looks like the levels stick around despite being filtered

plot <- ggplot(data=dataset_filtered, aes(x=dataset_filtered$Genre, y=dataset_filtered$Gross...US))

plot_sexy <- plot + 
             xlab("Genre") +
             ylab("Gross % US") +
             ggtitle("Domestic Gross % by Genre") +
             geom_jitter(aes(size=Budget...mill., colour=Studio)) +
             geom_boxplot(alpha=0.5) +
  
      ##All of our pretty stuff
             theme(
                  axis.title.x=element_text(colour="Blue"),
                  axis.title.y=element_text(colour="Blue")
                  
             )

      #Final touch - change the Budget...mil. label
      plot_sexy$labels$size <- "Budget $M" 
      #Call the size modifier of the labels in plot_sexy and set it to a string
  
      
      
      
  
      
       
