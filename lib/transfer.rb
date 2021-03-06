class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount 
  end

  def valid?
   @sender.valid?
   @receiver.valid?
  end

  def execute_transaction
    if valid? == false 
       @status = "rejected"
        "Transaction rejected. Please check your account balance."
      elsif @sender.balance < @amount
      @status = "rejected"
       "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
       "Transaction was already completed"
    else 
      @sender.deposit(amount * -1)
      @receiver.deposit(amount)
      @status = "complete"
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(amount)
      @receiver.deposit(amount * -1)
      @status = "reversed"
    end
  end
  
end
