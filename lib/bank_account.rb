class BankAccount
  def initialize
    @balance = 0.0
    @statement = "date || credit || debit || balance"
  end

  def deposit(amount)
    @balance += amount
    update_statement(deposited: amount)
  end

  def withdraw(amount)
    @balance -= amount
    update_statement(withdrawn: amount)
  end

  def statement
    print @statement
  end

  private

  def update_statement(deposited: nil, withdrawn: nil)
    date = get_date
    insert = deposited ? "#{sprintf('%.2f', deposited)} ||" : "|| #{sprintf('%.2f', withdrawn)}"
    @statement += "\n#{date} || #{insert} || #{sprintf('%.2f', @balance)}"
  end

  def get_date
    time = Time.now
    "#{time.day.to_s.rjust(2, "0")}/#{time.month.to_s.rjust(2, "0")}/#{time.year.to_s}"
  end
end
