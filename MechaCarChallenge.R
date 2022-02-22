# Deliverable 1

## Load dplyr package
library(dplyr)

## Import and Read in mechaCar_mpg.csv file
mech_table <- read_csv(file = '~/Desktop/Columbia DA Bootcamp/UNIT 5 - ADVANCED TOPICS/Module 15/MechaCar_Statistical_Analysis/MechaCar_mpg.csv')
head(mech_table)

## Use Linear Regression and pass six variables (columns) and add the dataFrame
reg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mech_table)
## Use summary() function, determine the p-value and the r-squared value for linear regression model
summary(reg)
summary(reg)$r.squared

# Deliverable 2

## Import and read in suspension_coil.csv file
coil_table <- read_csv(file = '~/Desktop/Columbia DA Bootcamp/UNIT 5 - ADVANCED TOPICS/Module 15/MechaCar_Statistical_Analysis/Suspension_Coil.csv')
head(coil_table)

## Create a total_summary dataframe using the summarize() to get the mean, median, variance, and std of the suspension coil's PSI column
total_summary <- coil_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance = var(PSI), SD = sd(PSI))
View(total_summary)

## Create a lot_summary dataframe using group_by() and summarize() to group each manufacturing lot
lot_summary <- coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups='keep')
View(lot_summary)

# Deliverable 3 

## Use t.test() to determine if the PSI across all manufacturing lots is statistically different from population mean of 1,500 pounds/sq.inch
t.test(log10(coil_table$PSI),mu=1500)

## Write 3 more Rscripts using t.test() and its subset() argument to determine if PSI for each manufacturing lot is different from population mean of 1,500 pounds.
t.test(subset(coil_table, Manufacturing_Lot == 'Lot1')$PSI, mu=1500)
t.test(subset(coil_table, Manufacturing_Lot == 'Lot2')$PSI, mu=1500)
t.test(subset(coil_table, Manufacturing_Lot == 'Lot3')$PSI, mu=1500)



