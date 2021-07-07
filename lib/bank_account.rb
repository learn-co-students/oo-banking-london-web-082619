# We're going to build a BankAccount class where one instance of the class can transfer money to 
# another instance through a Transfer class

class BankAccount 

    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name) #BankAccount.new(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def valid?
        @status == "open" && @balance > 0
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    def close_account
        @status = "closed"
    end

end
