class ATM:
    def __init__(self, bank, balance=0):
        self.bank = bank
        self.balance = balance
        self.transaction_history = []

    def check_balance(self):
        return f"Your balance is {self.balance} baht."

    def deposit(self, amount):
        self.balance += amount
        self.transaction_history.append(f"Deposited {amount} baht")
        return f"Deposited {amount} baht, New balance is {self.balance} baht."

    def withdraw(self, amount):
        if amount > self.balance:
            print("Insufficient funds") 
        self.balance -= amount
        self.transaction_history.append(f"Withdrew {amount} baht")
        return f"Withdrew {amount} baht, New balance is {self.balance} baht."

    def get_transaction_history(self):
        return self.transaction_history




# Example usage:
my_balance = ATM("kasikorn", 1000)
print(my_balance.bank)
print(my_balance.deposit(500))
print(my_balance.withdraw(200))
print(my_balance.check_balance())
print(my_balance.get_transaction_history())
