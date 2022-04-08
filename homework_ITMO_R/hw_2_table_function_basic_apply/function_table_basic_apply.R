#___ *apply functions________________________________________________________

my_function <- function(dataframe, row, column, computition, split_by = NULL){
  subset <- as.data.frame(dataframe[row,column])
  if (!is.null(split_by)){
  subset <- split(subset, split_by)
  subset <- subset$"TRUE"}
  
  func <- function(el){
    if(is.numeric(el)){
      computition(el)
    }
    else{
      #fact <- as.factor(el)
      #tapply(el, fact, length)
      list(frequency_table = data.frame(table(el)))
    }
  }
  
  ans <- sapply(subset,func)
  ans
  fin_ans <- list(subset, ans)
  fin_ans
  }
#___________________________________________________________________________
#__datasets preparing
test1 <- iris
test2 <- mtcars
test2$vs <- as.factor(test2$vs) # change data for a test (initially the dataset doens't have characters or factors)
test2$cyl <- as.character(test2$cyl) 

#__test
my_function(dataframe = test1, row = 5, column = 2:5, computition = mean, split_by =  data$Species == "setosa")
my_function(dataframe = test1, row = 5, column = 2:5, computition = mean)
my_function(dataframe = test1, computition = sum, split_by = data$Species == "virginica")

my_function(test2, 1:5, 2:3, sum)

