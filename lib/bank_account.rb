class BankAccount
  HEADER = 'date || credit || debit || balance'

  def initialize
    @balance = 0.0
    @statement = [HEADER]
  end

  def deposit(amount)
    check_valid(amount)
    @balance += amount
    update_statement(credit: amount)
  end

  def withdraw(amount)
    check_valid(amount)
    @balance -= amount
    update_statement(debit: amount)
  end

  def statement
    print @statement.join("\n")
  end

  private

  def update_statement(credit: nil, debit: nil)
    date = format_date
    credit_or_debit = get_credit_or_debit(credit, debit)
    @statement.insert(1, "#{date} || #{credit_or_debit} || #{format('%.2f', @balance)}")
  end

  def format_date
    time = Time.now
    "#{time.day.to_s.rjust(2, '0')}/#{time.month.to_s.rjust(2, '0')}/#{time.year}"
  end

  def get_credit_or_debit(credit, debit)
    credit ? "#{format('%.2f', credit)} ||" : "|| #{format('%.2f', debit)}"
  end

  def check_valid(amount)
    raise 'That is not a valid amount' if not_valid?(amount)
  end

  def not_valid?(amount)
    more_than_two_decimal_places(amount) || less_than_one_pence(amount)
  end

  def less_than_one_pence(amount)
    amount <= 0
  end

  def more_than_two_decimal_places(amount)
    (amount * 1.0).to_s.split('.').last.length > 2
  end
end
