q1 <- function() {
    
    ## Warning: for some reason it returns a wrong result !!!
    library(datasets)
    data(iris)
    
    factors <- c("setosa", "versicolor", "virginica")
    iris_length <- split(iris$Sepal.Length, factors)
    mean(iris_length[["virginica"]])
    
}