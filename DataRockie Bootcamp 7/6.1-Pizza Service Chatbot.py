def chatbot():
    print("Welcome to our pizza restaurant.")
    print("Do you want to order pizza?")
    while True:
        order = input("please select the choices (Y/N) >>>>> ")
        option1 = ["y", "n", "yes", "no"]

        if order.lower() not in option1:
            print("Please, select again!")

        if  order.lower() == "n" or order.lower() == "no":
            print("Thank you for your cooperation. We will be happy to serve you next time.")
            break

        if order.lower() == "y" or order.lower() == "yes":
            print("We have a special deal today!")
            time.sleep(2)
            print("It's a Hawaiian Pan Large size with free soft drink.")
            time.sleep(1)
            print("Would you like to get our deal offer?")

            while True:
                offer = input("select Y/N >>>>> ")
                if offer.lower() not in option1:
                    print("Please, select again!")
                
                if offer.lower() == "y" or offer.lower() == "yes":
                    time.sleep(1)
                    print("Your order is Haiian Pan Large size with free soft drink.")
                    time.sleep(1)
                    print("Just a moment. We will serve your order within 15 minutes.")
                    time.sleep(1)
                    print("Thank you for your cooperation. We'll be happy to serve you.")
                    break

                if offer.lower() == "n" or offer.lower() == "no":
                    time.sleep(1)
                    print("OK, We will proceed to a next process.")
                    pizza = {
                        "size": ["Small", "Medium", "Large"],
                        "crust": ["Crispy Thin", "Pan", "Extreme Cheese"],
                        "face": ["Double Cheese", "Pepperoni", "Hawaiian", "Seafood"],
                        "beverage": ["Plain Water", "Soft Drink", "Tea Milk", "Cocoa", "Peach Juice"]
                    }
                    while True:
                        time.sleep(1)
                        size1 = input("Select your pizza size (Small/Medium/Large) >>>>> ")
                        if size1.title() not in pizza["size"]:
                            print("Please, select again")
                        else:
                            break
                    
                    while True:
                        time.sleep(1)
                        crust1 = input("Select Crust (Crispy Thin/Pan/Extreme Cheese) >>>>> ")
                        if crust1.title() not in pizza["crust"]:
                            print("Please, select again")
                        else:
                            break
                    
                    while True:
                        time.sleep(1)
                        face1 = input("Select your Pizza (Double Cheese/Pepperoni/Hawaiian/Seafood) >>>>> ")
                        if face1.title() not in pizza["face"]:
                            print("Please, select again")
                        else:
                            break
                    
                    while True:
                        time.sleep(1)
                        bev = input("Select Beverage (Plain Water/Soft Drink/Tea Milk/Cocoa/Peach Juice) >>>>> ")
                        if bev.title() not in pizza["beverage"]:
                            print("Please, select again")
                        else:
                            break
                    
                    time.sleep(1)
                    print(f"Your order is {size1} {crust1} {face1} with {bev}.")
                    time.sleep(1)
                    print("Just a moment. We will serve your order within 15 minutes.")
                    time.sleep(1)
                    print("Thank you for your cooperation. We'll be happy to serve you next time.")
                    break

            break      
