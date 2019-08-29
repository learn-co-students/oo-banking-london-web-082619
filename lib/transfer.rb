# The Transfer class acts as a space for a transaction between two instances of the bank account class. 
# Think of it this way: you can't just transfer money to another account without the bank running checks first. 
# Transfer instances will do all of this, as well as check the validity of the accounts before the transaction occurs. 
# Transfer instances should be able to reject a transfer if the accounts aren't valid or if the sender doesn't have the money.

# Transfers start out in a "pending" status. They can be executed and go to a "complete" state. 
# They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status.

class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount) #Transfer.new(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
    end

    def valid?
      @sender.valid? && @receiver.valid? && @status == "pending"
    end
  
    def execute_transaction
      if !self.valid? || @sender.balance < @amount
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      else
        #increase receiver's account balance
        @receiver.deposit(@amount)
        #reduce sender's account balance
        @sender.balance -= @amount
        #set self.status = "complete"
        @status = "complete"
      end
    end

    def reverse_transfer #transfer.reverse_transfer
      if @status == "complete" && @receiver.balance > @amount
        @sender.deposit(@amount)
        @receiver.balance -= @amount
        @status = "reversed"
      else
        return "You cannot reverse a transfer which was never completed!"
      end
    end


end
