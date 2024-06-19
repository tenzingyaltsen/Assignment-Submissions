# Assignment 2 - Ahmed Mokhtar

#' Plan:
#' 1. Initial prompt 
#' 2. Place conditions to check if user input is valid
#' 3. If valid, check if it is an Armstrong number


#' The readline function is used to give the user the initial input
#' asking for a natural number. This value is assigned to "number". This 
#' is important since it will be used in the next steps.
number <- readline("Enter a natural number from 100 to 999: ")

#' Since I will be inputting customized error messages, I decided to
#' use the supressWarnings function to suppress the warning messages
#' sent by R. More importantly, I decided to convert the "number" variable
#' to a numeric value using the as.numeric function. I then assigned all of
#' this back to "number"
number <- suppressWarnings(as.numeric(number))

#' In this step I decided to create a "placeholder" variable and set it as
#' TRUE. This will become much much clearer as you go down the code and see 
#' how it is utilized. Essentially, the default is true. Under any of the
#' conditions below, it will be changed to false. At the end, I will perform 
#' an armstrong check. If the number is FALSE, the check will not be completed.
#' If it is still TRUE, that means that the number passed all the conditions
#' and thus has not been changed to false. As such, the check will go through.
placeholder <- TRUE

#' This the first "if statement". In this case, the first condition I am 
#' checking for is if the value of "number" is NA. In Line 19, if the 
#' the value entered is not numeric, R automatically saves it as a 
#' numeric NA. 
if (is.na(number)) {
  
  #' The following print function is used to tell the user that the entry is 
  #' not numeric, and encourages them to try again. This is followed by 
  #' labeling "placeholder" as false so an Armstrong check is not conducted
  #' later down the line. 
  print("The value you have entered is not numeric. Source and try again.")
  placeholder <- FALSE

  #' The else if function is used for the second condition, which is checking
  #' if the number is less than 100, meaning that it is not three digits.
  } else if (number < 100) {
  
  #' The following print function is used to tell the user that the entry is 
  #' less than 100, and encourages them to try again. This is followed by 
  #' labeling "placeholder" as false so an Armstrong check is not conducted
  #' later down the line. 
  print(paste(number, "is less than 100. Try again with a number from 100 to 999"))
  placeholder <- FALSE

  #' The else if function is used for the third condition, which is checking
  #' if the number is more than 999, meaning that it is not three digits.
  } else if (number > 999) {
  
  #' The following print function is used to tell the user that the entry is 
  #' above 999, and encourages them to try again. This is followed by 
  #' labeling "placeholder" as false so an Armstrong check is not conducted
  #' later down the line. 
  print(paste(number, "is more than 999. Try again with a number from 100 to 999"))
  placeholder <- FALSE
  } 

#' This if statement is used to check if an Armstrong should even be conducted
#' in the first place. This is done by checking if the placeholder is still
#' TRUE. If it is, then we proceed with the check. If it is false, that 
#' means that the user entry is invalid, so there is no point in checking
#' if it is an Armstrong number.
if (placeholder == TRUE) {
  
  #' In this step, I decided to create a vector containing all the possible 
  #' three digit Armstrong numbers. This was then assigned to the variable 
  #' "armstrong".
  armstrong <- c(153, 370, 371, 407)
  
  #' This if statement simple checks if the number entered by the user
  #' is one of the numbers in the Armstrong vectors using %in%.
  if (number %in% armstrong) {
  
    #' If the number is one of the Armstrong numbers, I used the paste function
    #' to combine the number with a statement that congratulates the user.    
    print(paste(number, "is an Armstrong number. Good job!"))
    
    #' The use of else here simply denotes that any number that does not meet
    #' the above conditions is included in the following condition.
    } else {
    
    #' The paste function is used to combine the number entered with a statement
    #' that the value entered is not an Armstrong number, and to try again.  
    print(paste(number, "is not Armstrong number. Try again!"))
    }
}
