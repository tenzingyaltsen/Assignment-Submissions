# Assignment 2 - Ahmed Mokhtar

number <- readline("Enter a natural number from 100 to 999: ")

number <- as.numeric(number)
#number <- suppressWarnings(as.numeric(number))

if (is.na(number)) {
  
  print("The value you have entered is not numeric. Source and try again.")

} else if (number < 100) {
  
  print(paste(number, "is less than 100. Try again with a number from 100 to 999"))

} else if (number > 999) {
  
  print(paste(number, "is more than 999. Try again with a number from 100 to 999"))

} 

armstrong <- c(153, 370, 371, 407)

if (number %in% armstrong) {
  print(paste(number, "is an Armstrong number. Good job!"))
} else {
  print(paste(number, "is not Armstrong number. Try again!"))
}
