require 'bank_account'

HEADER = "date || credit || debit || balance\n"

describe "deposit" do
  before(:each) do
    time = Time.now
    @date = "#{time.day.to_s.rjust(2, "0")}/#{time.month.to_s.rjust(2, "0")}/#{time.year}"
    @account = BankAccount.new
  end

  it "deposits an amount" do
    @account.deposit(1000)
    expect { @account.statement }.to output("#{HEADER}#{@date} || 1000.00 || || 1000.00").to_stdout
  end

  it "doesn't deposit a negative amount" do
    expect { @account.deposit(-1000) }.to raise_error("That is not a valid amount")
  end

  it "doesn't deposit an amount with too many decimal places" do
    expect { @account.deposit(1.005) }.to raise_error("That is not a valid amount")
  end
end