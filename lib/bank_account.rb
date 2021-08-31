class BankAccount
  attr_reader :balance
  
  def deposit(amount)
    @balance = amount
  end
end
