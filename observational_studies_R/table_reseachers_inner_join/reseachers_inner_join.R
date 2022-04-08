library(readxl)
library(tidyr)
library(dplyr)
library(stringr)
library(xlsx)

path_to_table_1 <- '/path_to_table/table_1.xlsx' #path to file 1 
path_to_table_2 <- '/path_to_table/table_2.xlsx' #path to file 2

table_1 <- read_excel(path_to_table_1)
table_2<- read_excel(path_to_table_2)

#_____________________
#1. table preparation

table_1_subset <- table_1 %>% select(3)
names(table_1_subset) <- 'name'

table_2_subset <- table_2 %>% select(2)
names(table_2_subset) <- 'name'

#______________________
#1.1 table 1 tiding 
surname_1 <- str_split_fixed(table_1_subset$name, pattern = ' ', n = 2) # split the column with surname and name on 2 
surname_1 <- c(surname_1[, 1]) # choose only surnames

surname_1 <- str_replace(surname_1, 'wrong_surname', 'right_surname') #tidy our data
table_1_subset$name <- surname_1 # save changes into 'name' column 


#1.2 table 2 tiding 
surname_2 <- str_split_fixed(table_2_subset$name, pattern = ' ', n = 2)
surname_2 <- c(surname_2[, 1])
table_2_subset$name <- surname_2

#_______________________
#2. finding common surnames for two tables (inner join)
common_surnames <- inner_join(table_1_subset, table_2_subset, by = 'name')

#___________________________
#3. counting the number of times of surnames (it shows us how many patients the researchers have)
reseachers_and_patients <- common_surnames %>% 
  group_by(name) %>% 
  summarise(N=n())

#_write output file as xlsx ____________
path_to_output_directory = 'path_to_output_directory' 
write.xlsx(reseachers_and_patients, file = paste0(path_to_output_directory, 'reseachers_and_patients', '.xlsx')) 


