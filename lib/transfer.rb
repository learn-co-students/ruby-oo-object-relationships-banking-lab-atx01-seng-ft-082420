class Transfer
  # your code here
  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid? == true
      true
    else
      nil
    end
  end

  def execute_transaction
    if sender.balance > amount && status == "pending" && sender.valid? && receiver.valid?
      sender.balance -= amount 
      receiver.balance += amount 
      self.status = "complete"
    else
      #binding.pry
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      "Cannot reverse"
    end
  end


end
