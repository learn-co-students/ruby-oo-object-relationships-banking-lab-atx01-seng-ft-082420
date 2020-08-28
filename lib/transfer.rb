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
    if sender.status && receiver.status == "open"
      true
    else
      false
    end
    
    if sender.valid? && receiver.valid?
      true
    end
  end

  def execute_transaction
    if sender.balance > amount && self.status == "pending" && self.valid?
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end

1
