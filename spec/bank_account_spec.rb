require 'bank_account'

describe BankAccount do
  it "should deposit an amount" do
    subject.deposit(1000)
    expect(subject.balance).to eq(1000)
  end
end
