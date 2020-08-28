require 'pry'
class Transfer
  attr_accessor :transfer, :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)

    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction 
    #binding.pry
    if self.status == "pending" && self.sender.balance > @amount && self.valid? == true 
      self.sender.balance -= @amount  
      self.receiver.balance += @amount 
      self.status = "complete"
      #binding.pry
    else  
      self.status = "rejected"
      p "Transaction rejected. Please check your account balance."
    end 
  end

  def reverse_transfer 
    if self.status == "complete"
      self.sender.balance += @amount 
      self.receiver.balance -= @amount 
      self.status = "reversed"
    end 

  end


end
