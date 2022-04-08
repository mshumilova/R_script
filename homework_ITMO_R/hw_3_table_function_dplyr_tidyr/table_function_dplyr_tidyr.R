library(dplyr)
library(tidyr)
library(rlang)

my_function <- function(dataframe, row, column, computition, split_by){
  subset <- dataframe %>% 
    select(column) %>% 
    slice(row)
  
  counting <- subset %>% 
    group_by(UQ(sym(split_by))) %>%  #I should "explain" to the function that "split_by" is a variable. the same thing happens with the 'filter' function
    summarise_all(computition)
  
    freq_table <- subset %>% 
    group_by(UQ(sym(split_by))) %>% 
    summarise(Frequency = n())
  
    ans <- cbind(counting, freq_table[, 2])
  
  print(ans)
  
}

test1 <-  iris
my_function(dataframe = test1, row = 1:99, column = 2:5, computition = mean, split_by = 'Species')

test2 <- mtcars
my_function(test2, 1:5, 2:7, sum, split_by = 'cyl')

