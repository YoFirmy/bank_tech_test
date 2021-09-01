require 'bank_account'

HEADER = "date || credit || debit || balance\n"

describe "statement" do
  it "should print collumn headers" do
    account = BankAccount.new
    expect { account.statement }.to output(HEADER).to_stdout
  end 
end