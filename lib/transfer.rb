require 'pry'

class Transfer
  @@all = [] 

  attr_accessor :status, :amount
  attr_reader :sender, :receiver
    def initialize(sender, receiver, amount) #why not status?
      @sender = sender 
      @receiver = receiver
      @status = "pending"
      @amount = amount 
      @@all << self 
    end
    
    def self.all
      @@all 
    end 

    def valid?
      @sender.valid? && @receiver.valid? ? true : false 
    end 

    def execute_transaction
      if valid? && @sender.balance > @amount && @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else 
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end 
    end 

    def reverse_transfer
      if @status == "complete" 
       @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
      end 
    end
  

end

