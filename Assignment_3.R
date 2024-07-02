# Assignment 3 - Ahmed Mokhtar

#' The text file containing the list of words was created. I then used the 
#' readLines function to read the file, and assigned it to "list".

list <- readLines("hangman.txt")

#' The "sample" function allows R to randomly select one word from "list".
sample(list, 1)



