# Assignment 2 - Ahmed Mokhtar

number <- readline("Enter a number from 100 to 999: ")

number <- as.numeric(number)
#number <- suppressWarnings(as.numeric(number))

if (is.na(number)) {
  
  print("The value you have entered is not numeric. Source and try again.")
} else if (number < 100) {
  
  print(paste(number, "is less than 100. Try again with a number from 100 to 999"))
  
} else if (number > 999) {
  
  print(paste(number, "is more than 999. Try again with a number from 100 to 999"))
  
}

