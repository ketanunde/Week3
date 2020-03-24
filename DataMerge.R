# Create the managers data frame
# Refer to notes "creating a dataset - problem" on Blackboard 
# for more information

column_names <- c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")

# Enter data into vectors before constructing the data frame
date_col <- c("2018/15/10", "2018/01/11", "2018/21/10", "2018/28/10", "2018/01/05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99) # 99 is one of the values in the age attribute - will require recoding
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2) # NA is inserted in place of the missing data for this attribute
q5_col <- c(5, 5, 2, NA, 1)

# Construct a data frame using the data from all vectors above
managers <- data.frame(date_col, country_col, gender_col, age_col, q1_col, q2_col, q3_col, q4_col, q5_col)

# Add column names to data frame using column_names vector
colnames(managers) <- column_names

# Recode the incorrect 'age' data to NA
managers$Age[managers$Age == 99] <- NA

# Create a new attribute called AgeCat and set relevant valuess
# in AgeCat to the following if true:
# <= 25 = Young
# >= 26 & <= 44 = Middle Aged
# >= 45 = Elderly

# We will also recode age 'NA' to Elder
managers$AgeCat[managers$Age >= 45] <- "Elder"
managers$AgeCat[managers$Age >= 26 & managers$Age <= 44] <- "Middle Aged"
managers$AgeCat[managers$Age <= 25] <- "Young"
managers$AgeCat[is.na(managers$Age)] <- "Elder"

# Recode AgeCat so that is ordinal and factored with the
# order Young, Middle aged, Elder
# We'll store the ordinal factored data in variable 'AgeCat'
AgeCat <- factor(managers$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))

# Replace managers AgeCat attribute with newly ordinal foctored data
managers$AgeCat <- AgeCat

# Create a new column called 'summary_col' that
# contains a summary of each row
summary_col <- managers$Q1 + managers$Q2 + managers$Q3 + managers$Q4 + managers$Q5
summary_col

# Add summary_col to the end of the data frame
managers <- data.frame(managers, summary_col)

# Calculate mean value for each row
mean_value <- rowMeans(managers[5:9])

# Add mean_value to end of managers data frame
managers <- data.frame(managers, mean_value)

# Show data frame contents
managers

# Change the name of this column to "mean value"
names(managers)[12] <- "mean value"

# Change name of summary_col to "Answer total"
names(managers)[11] <- "Answer total"

# Show managers structure
str(managers)

# Change the date structure from the factor
# to the required date structure

# Note : We cannot convert a factor variable to date
# without first converting to a character variable
# from the default factor variable
date_field   <- as.character(managers$Date)
new_date <- as.Date(date_field, "%Y/%d/%m")
str(new_date)

# Now overwrite the contents of the date field with new date structure
managers$Date = new_date
str(managers)


getwd()

new_managers_data <- read.csv("")

#show structure
str(new_managers_data)


#chose records w need to merge
names(new_managers_data)

include_list <- new_managers_data[c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")]
include_list

#or we could do this
include_list <- new_managers_data[c(6, 3, 7, 4, 8:12 )]
include_list

#we cant rbind yet
rbind(managers, include_list)



# we can create blank column and import into dataframes
blank_cols <- c("AgeCat", "Answer total", "mean value")
include_list[, blank_cols] <- NA


#or
attach(include_list)
include_list$AgeCat[Age >= 45] <- "Elder"
include_list$AgeCat[Age >= 26 & managers$Age <= 44] <- "Middle Aged"
include_list$AgeCat[Age <= 25] <- "Young"
include_list$AgeCat[is.na(Age)] <- "Elder"
detach(include_list)

attach(include_list)
include_list$'Answer total' <- Q1 + Q2 + Q3 + Q4 + Q5
#Calculate mean value
include_list$ 'mean value' <- rowMeans(include_list[5:9])
detach(iinclude_list)


#convert the date field
str(include_list$Date)
#default R date structure is yyyy-mm-dd
# Default structure is currently mm/dd/yyyy

#restructure the charechter vector first
restructured_date <- as.character(include_list$Date)
str(restructured_date)

restructured_date <- as.Date(restructured_date, "%m/%d%Y")
restructured_date
str(restructured_date)


#assign restructured date into date field in include_list
str(include_list$Date)
include_list$Date <- restructured_date
str(include_list$Date)


#convert the date field of manager to be into the same format as include_list
# Managers Date Structure is in structure yyyy-dd-mm
str(managers$Date)

managers_Converted_ date1 <-  as.Date(managers$Date, "%Y-%d-%m")
str(managers_converted_date)
str(restructured_date1)




