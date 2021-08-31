require 'bank_account'

describe BankAccount do
  describe "#deposit" do
    it "should deposit an amount" do
      subject.deposit(1000)
      expect(subject.instance_variable_get(:@balance)).to eq(1000)
    end
  end

  describe "balance" do
    it "should have a balance of 0 when initialized" do
      expect(subject.instance_variable_get(:@balance)).to eq(0)
    end
  end
end
