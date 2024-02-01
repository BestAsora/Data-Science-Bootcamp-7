library(glue)

game <- function() {
  print("Welcome to Rock Scissors Paper Game")
  username <- readline("Please, Enter your username: ")
  print("Game Start!!!")
  
  round <- 0
  user_win <- 0
  user_tie <- 0
  user_lose <- 0
  
  while (TRUE) {
    print("This is your choices. >> Rock/Scissors/Paper")
    print("When you want to end the game. Type 'Finish'")
    user_select <- readline("Select your choices: ")
    options <- c("rock", "scissors", "paper")
    
    computer_select <- sample(options, 1)
    
    if(tolower(user_select) == "finish") {
      print("This game has ended")
      cat("Result", "\n")
      print(glue("Total Round: {round}"))
      print(glue("Win: {user_win}"))
      print(glue("Draw: {user_tie}"))
      print(glue("Lose: {user_lose}"))
      if (user_win > user_lose) {
        print(glue("Congratulation! {username} win this game!"))
      } else if (user_win == user_lose) {
        print("It's regrettable, just a bit more.")
      } else {
        print("Don't be sad. It's only a bad luck.")
      }
      break
    }
    
    if (!tolower(user_select) %in% options) {
      print("Please select again")
      next
    }
    
    if (tolower(user_select) == computer_select) {
      print("Tie")
      round <- round + 1
      user_tie <- user_tie + 1
    } else if ((tolower(user_select) == "rock" && computer_select == "scissors") ||
               (tolower(user_select) == "scissors" && computer_select == "paper") ||
               (tolower(user_select) == "paper" && computer_select == "rock")) {
      print("Win")
      round <- round + 1
      user_win <- user_win + 1
    } else {
      print("Lose")
      round <- round + 1
      user_lose <- user_lose + 1
    }
  }
}
