class BankAccount
  HEADER = "date || credit || debit || balance"

  def initialize
    @balance = 0.0
    @statement = [HEADER]
  end

  def deposit(amount)
    raise "Cannot deposit less than 1p" if not_valid?(amount)
    @balance += amount
    update_statement(credit: amount)
  end

  def withdraw(amount)
    raise "Cannot withdraw less than 1p" if not_valid?(amount)
    @balance -= amount
    update_statement(debit: amount)
  end

  def statement
    print @statement.join("\n")
  end

  private

  def update_statement(credit: nil, debit: nil)
    date = get_date
    credit_or_debit = get_credit_or_debit(credit, debit)
    @statement.insert(1, "#{date} || #{credit_or_debit} || #{sprintf('%.2f', @balance)}")
  end

  def get_date
    time = Time.now
    "#{time.day.to_s.rjust(2, "0")}/#{time.month.to_s.rjust(2, "0")}/#{time.year.to_s}"
  end

  def get_credit_or_debit(credit, debit)
    credit ? "#{sprintf('%.2f', credit)} ||" : "|| #{sprintf('%.2f', debit)}"
  end

  def not_valid?(amount)
    amount < 0.01
  end
end
