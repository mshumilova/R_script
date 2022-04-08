Task

Write a function (using *apply()) that:
1. Takes data frame, row selection and column selection as arguments
2. Add formal argument to split the data
3. Subsets data according to the given selections. Possible selections are:
	By index/indexes
	By name/names	
	By logical vector
4. For each column of the subsetted data performs some computations:
	For numeric data – any of sum(), mean(), sd(), etc. As you wish
	For non-numeric data (characters and logical vectors, factors) – frequency table
5. Returns an output as a data frame and calculation results as a list (subset + summary)



