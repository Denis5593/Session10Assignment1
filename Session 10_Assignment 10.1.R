getwd()

# Import dataset from the following link: AirQuality Data Set

library(xlsx)
write.xlsx(airquality, "C:/Users/Denis/R Studio/Notes/airquality.xlsx")

# Perform the following written operations:

# 1. Read the file in Zip format and get it into R.

unzip("airquality.zip")

# 2. Create Univariate for all the columns.

library(dlookr)

describe(airquality)
normality(airquality)


# 3. Check for missing values in all columns.

sapply(airquality, function(x) sum(is.na(x)))

# 4. Impute the missing values using appropriate methods.

library(mice)
library(VIM)
library(lattice)

md.pattern(airquality)

# 5. Create bi-variate analysis for all relationships.

correlate(airquality)

# 6. Test relevant hypothesis for valid relations.

# The null hypothesis is that the monthly ozone density are identical populations. 
# To test the hypothesis, we apply the kruskal.test function to compare the independent 
# monthly data. The p-value turns out to be nearly zero (6.901e-06). 
# Hence we reject the null hypothesis.

kruskal.test(Ozone ~ Month, data = airquality)


# 7. Create cross tabulations with derived variables.

table(airquality$Ozone, airquality$Solar.R)

# 8. Check for trends and patterns in time series.

library(ggfortify)
cycle(airquality)

# 9. Find out the most polluted time of the day and the name of the chemical compound.

head(airquality)
summary(airquality)

