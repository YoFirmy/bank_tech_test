class BankAccount
  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def statement
    print "date || credit || debit || balance"
  end
end
