class BankAccount
@@all = []
    attr_reader :name 
    attr_accessor :balance, :status

    def initialize(name) #why just name and not balance, status? when ?
        @name = name 
        @balance = 1000 
        @status = "open" 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def deposit(money)
        @balance += money
    end 

    def display_balance 
        "Your balance is $#{@balance}." 
    end 

    def valid?
     @status == "open" && @balance > 0? true : false 
    end 

    def close_account
        self.status = "closed"
    end 
end
