# Assignment 2 - Ahmed Mokhtar

number <- readline("Enter a three digit positive number: ")

number <- as.numeric(number)

if (is.na(number)) {
  
  print("The value you have entered is not numeric. Source and try again.")
} else if (is.numeric(number)) {
  
  print(paste("Thank you! The number you entered is", number)) 
}

