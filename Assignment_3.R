# Assignment 3 - Ahmed Mokhtar

#' The text file containing the list of words was created. I then used the 
#' readLines function to read the file, and assigned it to "list".

suppressWarnings(list <- readLines("hangman.txt"))

#' The following readline is just an interactive input to keep the user
#' engaged, by referring to them with their name. 

username <- readline(prompt = "Hi! What's your name?  ")

#' The "sample" function allows R to randomly select one word from "list". 
#' I have decided to assign this random word to the variable "word".

word <- sample(list, 1)

#' Next I decided to make "word" all lower case for the sake of consistency.

word <- tolower(word)

#' The following function counts the number of characters in the random word.
#' It then assigns that value to "wlength".

wlength <- nchar(word)

#' The following print and paste functions welcome the user, lay out the rules of the game,
#' and tell the user how many letters are in the word.

print(paste0("Welcome to hangman, ", username, "!!!!"))
print("Before we get started, here are the rules of the game:")
print("1. Enter one letter at a time.")
print("2. Do not enter the same letter twice.")
print("3. You have 5 tries to complete the word.")
print("Now that you know the rules of the game, here's your first hint!")

print(paste("This word has", wlength, "letters." ))

#' The allinputs variable is designated to capture all the letters that 
#' have been guessed by the user. This becomes very helpful for the next step
#' in the inputfunction, and has utility in sebsequent functions.

allinputs <- c()

#' The input function is designated for checking if the entry made is eligible
#' and meets the criteria of being only one letter. This function will be later 
#' used as a prerequisite to other functions, in order to not unnecessarily run
#' lines. 

inputfunction <- function(allinputs) {

#' placeholder created and marked as true. This placeholder is used to run the
#' while loop as long as it stays true.
  
  placeholder <- TRUE
  
#'This is essentially saying "while the placeholder is true..."
  
  while (placeholder) {
  
#' This prompts the user to enter a letter using readline. I also decided to 
#' lowercase the entries so it stays consistent throughout. It is then assigned 
#' to "guess".

    guess <- tolower(trimws(readline("Enter a letter:  ")))

#' The following checks for the correct number of characters (1) and if the entry 
#' is a letter between a-z. 
        
    if (nchar(guess) == 1 && grepl("[a-z]", guess)) {
      
#' Once it passes the test above, it is then checked if the entry has already been 
#' tried before, by checking if it is in allinputs. If it is, it leaves a message to the
#' user and restarts the while loop. 

      if (guess %in% allinputs) {
        print(paste("Oh no! Looks like you already made that guess before. Try again", username, "."))
      } else {

#' Setting the placeholder to false is crucial since it breaks out of the while loop.        
        
        placeholder <- FALSE
      }
     
      
    } else {

#' This tells the message the user that their input is invalid, and that they need 
#' to put in only one letter.  
      
      print(paste0("Your input is invalid ", username, ". Please enter only one letter!"))
    }
  }
  return(guess)
}

#' This function was created to check if the letter entered is in the word.
#' This uses the combination of return and grep1 to label the input as true
#' or false depending on if it was in the word. This will be later used
#' to create a placeholder to see what the next steps should be. 

wordcheck <- function(word, guess) {
  return(grepl(guess, word))
}

#' This variable is created, containing the underscores that will 
#' be displayed until the user inputs a right input. It is set 
#' to the length of the word "wlength".

rightinputs <- rep("_", wlength)

#' This function replaces the dashes in rightinputs with the correct letter
#' from guess.  
dashesupdate <- function(word, guess, rightinputs) {

#' This step converts the word to a vector, breaking up all the individual
#' letters in the word. 
  characters <- unlist(strsplit(word, ""))

#' A for loop is created in order to check over every letter in the vector.
#' If it is found that the letter "guess" is in "characters", it is 
#' then replaced with the dash in its respective index.
  for (i in 1:length(characters)) {
    
    if (characters[i] == guess) {
    
        rightinputs[i] <- guess
    }
  }
  return(rightinputs)
}

#' This variable is created to signify the number of remaining number
#' of tries. It starts at 5.

remaining <- 5

#' This function is created to record the number of attempts remianing
#' by subtracting 1 from the existing value. By default, "remaining" starts 
#' at 5, and decreases from there. This will be incredibly useful in the 
#' game loop.

attemptsupdate <- function(remaining) {
  return(remaining - 1)
}

#' This function simply combines the "guess" inputted with
#' the inputs already given "allinputs". This essentially 
#' just shows the user all the letters they have entered. 

lettersupdate <- function(allinputs, guess) {
  return(c(allinputs, guess))
}

#' The following while loop can be considered the game loop, that 
#' essentially combines all the functions created up to this point.
#' This while loop is set to begin if the number of attempts the user
#' has are over 0, and if there are still underscores present, meaning 
#' that the user has not guessed all the letters of the word. 

while (remaining > 0 && any(rightinputs == "_")) {
  
#' The following lines use the functions we have created so far to 
#' perform simple tasks. The first uses inputfunction to make sure that
#' the entry made by the user are valid based on the parameters in the
#' function. the second updates the letters in allinputs by adding in
#' the guess the user made. We then create a new placeholder with a 
#' true/false label depending on if the letter entered is in the word
#' using the "wordcheck" function.
 
  guess <- inputfunction(allinputs)
  allinputs <- lettersupdate(allinputs, guess)
  placeholder2 <- wordcheck(word, guess)

#' The following if statement is entered on the condition that the 
#' placeholder is marked as true, meaning that the letter is in the
#' word. It then uses "dashesupdate" to replace the underscores with 
#' the right letter. This is followed by a prompt showing the user 
#' their progress so far. If the placeholder is not true, the else
#' portion uses "attemptsupdate" to subtract one attempt, since their
#' entry is incorrect.
    
  if (placeholder2) {
    rightinputs <- dashesupdate(word, guess, rightinputs)
    print(paste("Good job! The word now looks like this:", paste(rightinputs, collapse = " ")))
  } else {
    remaining <- attemptsupdate(remaining)
    print(paste("Sorry, that letter is not in the word. You have", remaining, "attempts left."))
  }

#' The users are then prompted with all the letters they have guessed 
#' so far using "allinputs".
  print(paste("Here are all the letters you have guessed so far:", paste(allinputs, collapse = " ")))
}

#' If the user makes it to this point, that means they no longer meet the
#' conditions of the game loop. This simply means they no longer have
#' any attempts left, or there are no dashes left, signalling that 
#' they have solved the puzzle.

#'The if statement simply checks for the presence of any underscores
#'in "rightinputs". If there are none, it shows a great job
#'message. If that condition is not met, then it tells the user that
#'they have used up all of their attempts and have lost the game. 

if (all(rightinputs != "_")) {
  print(paste0("Great job ", username, "! You found the word!"))
} else {
  print(paste0("BOOOOOOOOOO! You've used up all your attempts ", username, "! The word was: ", word))
}