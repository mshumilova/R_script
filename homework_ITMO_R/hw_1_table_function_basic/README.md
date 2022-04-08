Task

Write a function that:

1. Takes data frame, row selection and column selection as arguments
2. Subsets data according to the given selections. Possible selections are:
	By index/indexes
	By name/names
	By logical vector
3. For each column of the subsetted data performs some computations:
	For numeric data – any of sum(), mean(), sd(), etc. As you wish
	For non-numeric data (characters and logical vectors, factors) – frequency table
4. Returns an output as a data frame and calculation results as a list (subset + summary)

Apply it in a few examples for test
