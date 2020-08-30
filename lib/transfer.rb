require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
   @status = "pending"
   @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid? == true
      true
    else
      false
    end
  end
  
  def execute_transaction
    if sender.balance > amount && self.status == "pending" && self.valid?
      receiver.balance += amount
      sender.balance -= amount
      @status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end

end