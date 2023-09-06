library(stringr)
library(glue)

chatbot <- function() {
  while (TRUE) {
    pizza <- readline("Do you want to order pizza? (Yes or No): ")
    option1 <- c("yes", "no")
    if (tolower(pizza) == "no") {
      print("Thank you for your cooperation. We will be happy to serve you.")
      break
    }
    
    if (tolower(pizza) == "yes") {
      print("We have a special promotion today!")
      print("It's Hawaiian Pan Large size with free soft drink.")
      while (TRUE) {
        offer <- readline("Would you like to get our special offer? (Yes or No): ")
        option2 <- c("yes", "no")
        if (tolower(offer) == "yes") {
          print("Your order is Hawaiian Pan Large size with free soft drink.")
          print("Just a moment. We will serve your order within 15 minutes.")
          print("Thank you for your cooperation. We will be happy to serve you.")
          break
        }
        if (tolower(offer) == "no") {
          print("OK, We will proceed to a next process.")
          while (TRUE) {
            size <- readline("Select your pizza size (Small/Medium/Large): ")
            option3 <- c("Small", "Medium", "Large")
            if (!str_to_title(size) %in% option3) {
              print("Please, select again")
            } else {
              break
            }
          }
          
          while (TRUE) {
            crust <- readline("Select Crust (Crispy Thin/Pan/Extreme Cheese): ")
            option4 <- c("Crispy Thin", "Pan", "Extreme Cheese")
            if (!str_to_title(crust) %in% option4) {
              print("Please, select again")
            } else {
              break
            }
          }
          
          while (TRUE) {
            pizz <- readline("Select your Pizza (Double Cheese/Pepperoni/Hawaiian/Seafood): " )
            option5 <- c("Double Cheese", "Pepperoni", "Hawaiian", "Seafood")
            if (!str_to_title(pizz) %in% option5) {
              print("Please, select again")
            } else {
              break
            }
          }
          
          while (TRUE) {
            bev <- readline("Select Beverage (Plain Water/Soft Drink/Tea Milk/Cocoa/Peach Juice): ")
            option6 <- c("Plain Water", "Soft Drink", "Tea Milk", "Cocoa", "Peach Juice")
            if (!str_to_title(bev) %in% option6) {
              print("Please, select again")
            } else {
              break
            }
          }
          
          print(glue("Your order is {str_to_title(size)} {str_to_title(crust)} {str_to_title(pizz)} with {str_to_title(bev)}."))
          ## print(paste("Your order is", str_to_title(size), str_to_title(crust), str_to_title(pizz), "with", str_to_title(bev), ".", collapse = ""))
          print("Just a moment. We will serve your order within 15 minutes.")
          print("Thank you for your cooperation. We will be happy to serve you.")
          break
        }
        if (!tolower(offer) %in% option2) {
          print("Please, select again")
        }
      }
      break
    }
    
    if (!tolower(pizza) %in% option1) {
      print("Please, select again")
    }
  }
}

