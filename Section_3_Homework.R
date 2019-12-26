###----SECTION 3 HOMEWORK----

#Supplied two vectors: monthly revenue and monthly expenses for the year
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)



#All results are vectors
#Dollar values are presented in units of $1,000 to the nearest $0.01 precision, but with no decimal points
#Ratios are presented in percentages with no decimal points

#Calculate:
##Profit for each month
##Profit is revenue - expenses

profit <- (revenue - expenses)/1000


##Profit after tax for each month (tax rate is 30%)

profit_after_tax <- (profit * 0.7)/1000


##Profit margin for each month - profit after tax divided by revenue

profit_margin <- round(((profit_after_tax / revenue) * 100))


##Good months - where the profit after tax was greater than the mean for the year

months <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")

good_months <- rep(NA)
for (i in 1:12){
  if (profit_after_tax[i] > mean(profit_after_tax)){
    good_months[i] = months[i]
  } 
  
}
##Make it look nicer
good_months <- na.omit(good_months)


##Bad months - where the profit after tax was LESS THAN the mean for the year
##Exact same code as above, but swap the if clause

bad_months <- rep(NA)
for (i in 1:12){
  if (profit_after_tax[i] < mean(profit_after_tax)){
   bad_months[i] = months[i]
  } 
  
}
bad_months <- na.omit(bad_months)


#The Best Month (highest profit after tax)
best_month <- rep(NA)
for (i in 1:12){
  if (profit_after_tax[i] == max(profit_after_tax)){
    best_month[i] = months[i]
  } 
  
}
best_month <- na.omit(best_month)




#The Worst Month
worst_month <- rep(NA)
for (i in 1:12){
  if (profit_after_tax[i] == min(profit_after_tax)){
    worst_month[i] = months[i]
  } 
  
}
worst_month <- na.omit(worst_month)


