require 'bank_account'

HEADER = "date || credit || debit || balance\n"

describe "withdraw" do
  before(:each) do
    time = Time.now
    @date = "#{time.day.to_s.rjust(2, "0")}/#{time.month.to_s.rjust(2, "0")}/#{time.year}"
    @account = BankAccount.new
  end

  it "withdraws an amount" do
    @account.withdraw(1000)
    expect { @account.statement }.to output("#{HEADER}#{@date} || || 1000.00 || -1000.00").to_stdout
  end

  it "doesn't withdraw a negative amount" do
    expect { @account.withdraw(-1000) }.to raise_error("That is not a valid amount")
  end

  it "doesn't withdraw an amount with too many decimal places" do
    expect { @account.withdraw(1.005) }.to raise_error("That is not a valid amount")
  end
end