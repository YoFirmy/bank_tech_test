require_relative 'statement'

class BankAccount
  def initialize(statement: Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    raise_errors(amount)
    @balance += amount
    @statement.update(credit: amount, balance: @balance)
  end

  def withdraw(amount)
    raise_errors(amount)
    @balance -= amount
    @statement.update(debit: amount, balance: @balance)
  end

  def statement
    @statement.display
  end

  private

  def raise_errors(amount)
    raise 'That is not a valid amount' if not_valid?(amount)
  end

  def not_valid?(amount)
    more_than_two_decimal_places(amount) || less_than_one_pence(amount)
  end

  def more_than_two_decimal_places(amount)
    (amount * 1.0).to_s.split('.').last.length > 2
  end

  def less_than_one_pence(amount)
    amount <= 0
  end
end
