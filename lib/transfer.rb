class Transfer
  # your code here

  attr_reader :sender, :receiver, :amount, :status
  # attr_accessor

  def initialize (sender, receiver, amount)
    @status = "pending"
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?()
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
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
