class BankAccount
  def initialize
    @balance = 0.0
    @statement = "date || credit || debit || balance"
  end

  def deposit(amount)
    @balance += amount
    update_statement(amount)
  end

  def withdraw(amount)
    @balance -= amount
  end

  def statement
    print @statement
  end

  private

  def update_statement(amount)
    date = get_date
    @statement += "\n#{date} || #{sprintf('%.2f', amount)} || || #{sprintf('%.2f', @balance)}"
  end

  def get_date
    time = Time.now
    "#{time.day.to_s.rjust(2, "0")}/#{time.month.to_s.rjust(2, "0")}/#{time.year.to_s}"
  end
end
