require_relative './bank_account'
require 'pry'

class Transfer

    attr_accessor :sender, :receiver, :amount, :status
  
    def initialize(sender, receiver, amount, status="pending")
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = status
    end

    def valid?
      if self.sender.valid? && self.receiver.valid?
        return true
      end
        false  
    end

    def execute_transaction
      if self.status == "pending"
        if self.valid? && (self.sender.balance > self.amount)
          self.status = "complete"
          self.sender.balance -= self.amount
          self.receiver.balance += self.amount
        else
          self.status = "rejected"
          return "Transaction rejected. Please check your account balance."
        end
      end
      nil
    end

    def reverse_transfer
      if self.status == "complete"
        self.receiver.balance -= self.amount
        self.sender.balance += self.amount
        self.status = "reversed"
      end
    end

end