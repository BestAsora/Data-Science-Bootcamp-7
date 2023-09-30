import random
def game():
    print("Welcome to Rock Scissors Paper Game")
    username = input("Please, Enter your username: ")
    time.sleep(1)
    print("Next")
    time.sleep(1)
    print("3")
    time.sleep(1)
    print("2")
    time.sleep(1)
    print("1")
    time.sleep(1)
    print("Game Start!!!")

    round = 0
    user_win = 0
    user_draw = 0
    user_lose = 0

    while True:
        print("This is your choices. (Rock/Scissors/Paper)")
        print("you can select the choices by typing the choices we give you.")
        print("When you want to end the game. Type 'Finish'")
        user_select = input("Select your choice: ")
        option = ["rock", "scissors", "paper"]

        # random.sample can't be used because it returns list not string
        """
            random.choice/random.choices = can repeat values from list or bracket
            random.sample = result doesn't have duplicate values from list or bracket
        """
        computer_select = random.choice(option) #computer_select = random.choices(option, weights=[1, 20, 1], k=1)[0] when you want to fix/adjust your result.

        if user_select.lower() == "finish":
            print("This game had ended.")
            print(f"""Result
            Total Round: {round}
            Win: {user_win}
            Draw: {user_draw}
            Lose: {user_lose}""")
            if user_win > user_lose:
                print(f"Congratulation! {username} win this game!")
                print("Thank you for playing our game.")
            elif user_win == user_lose:
                print("It's regrettable, just a bit more.")
                print("Thank you for playing our game.")
            else:
                print("Don't be sad. It's only a bad luck.")
                print("Thank you for playing our game.")
            break

        if user_select.lower() not in option:
            print("Please select again")
            continue

        if user_select.lower() == computer_select:
            print(computer_select)
            print("Draw")
            round += 1
            user_draw += 1
        elif (user_select.lower() == "rock" and computer_select == "scissors") or (user_select.lower() == "scissors" and computer_select == "paper") or (user_select.lower() == "paper" and computer_select == "rock"):
            print(computer_select)
            print("Win")
            round += 1
            user_win += 1
        else:
            print(computer_select)
            print("Lose")
            round += 1
            user_lose += 1
