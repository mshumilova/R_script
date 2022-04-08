#_____functions____________________________________________________________

my_function <- function(dataframe, row, column, computition){
   data <- as.data.frame(dataframe[row,column]) #subset ! as.dataframe - for table func (result is 1D array if one factor is given) 
   
   ans <- list()
   for (el in data){
     
     if (is.numeric(el)){
     ans <- append(ans, computition(el)) #for numerical data - counting
     }
     
     if(!is.numeric(el)){ 
     ans<- append(ans, list(data.frame(table(el)))) #for non-numerical data - frequency table
     }
   }
   names(ans) <- names(data)
   fin_ans <- list(data, ans)
   return(fin_ans)
}
#__________________________________________________________________________
#__datasets preparing
test1 <- iris
test2 <- mtcars
test2$vs <- as.factor(test2$vs) # change data for a test (initially the dataset doens't have characters or factors)
test2$cyl <- as.character(test2$cyl) 

#__test______________

# test with a logical vector and characters
row_test <- test1$Sepal.Length < 5
my_function(test1, row_test, c("Petal.Length", "Petal.Width"), mean)

# test with number/numbers
my_function(test1,1:10, 2:5, sd)
my_function(test1,1:10, 5)

# test with another dataset
my_function(test2, 1:5, 2:3, sum)

