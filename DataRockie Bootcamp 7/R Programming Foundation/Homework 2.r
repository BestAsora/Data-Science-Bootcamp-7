junken <- function() {
  print("Welcome to Rock Scissors Paper Game!")
  print("Enter your username")
  user_name <- readLines("stdin", 1)
  print("This is your options")
  options <- c("rock", "scissors", "paper")
  print(paste(options, collapse = ", "))
  
  count <- 0
  user_wins <- 0
  computer_wins <- 0
  
  while (TRUE) {
    print("Choose one (type 'done' to exit): ")
    user_select <- readLines("stdin", 1)
    
    if (tolower(user_select) == "done") {
      print("Game over. Here are the results:")
      cat("Total Round: ", count, "\n")
      cat("User Wins: ", user_wins, "\n")
      cat("Computer Wins: ", computer_wins, "\n")
      if (user_wins > computer_wins) {
        print(paste("Congratulation!", user_name, ", You win the game."))
      } else if (computer_wins > user_wins) {
        print("You should bring more luck. :)")
      } else if (user_wins == computer_wins) {
        print("How can this be!")
      }
      break
    }
    
    if (!tolower(user_select) %in% options) {
      print("Please choose from 'rock', 'scissors', or 'paper' only.")
      next
    }
    
    computer_select <- sample(options, 1)
    
    if (user_select == computer_select) {
      print("It's a tie!")
      count <- count + 1
    } else if (
      (user_select == "rock" && computer_select == "scissors") ||
      (user_select == "scissors" && computer_select == "paper") ||
      (user_select == "paper" && computer_select == "rock")
    ) {
      print("You win!")
      user_wins <- user_wins + 1
      count <- count + 1
    } else {
      print("You lose!")
      computer_wins <- computer_wins + 1
      count <- count + 1
    }
  }
}

junken()
