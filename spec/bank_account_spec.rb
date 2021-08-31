require 'bank_account'

describe BankAccount do
  describe "#initialization" do
    it "should have a balance of 0 when initialized" do
      expect(subject.instance_variable_get(:@balance)).to eq(0)
    end
  end

  describe "#deposit" do
    it "should deposit an amount" do
      subject.deposit(1000)
      expect(subject.instance_variable_get(:@balance)).to eq(1000)
    end

    it "should update correctly after multiple deposits" do
      subject.deposit(1000)
      subject.deposit(500)
      expect(subject.instance_variable_get(:@balance)).to eq(1500)
    end
  end

  describe "#withdraw" do
    it "should withdraw an amount" do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.instance_variable_get(:@balance)).to eq(500)
    end
  end

  describe "#statement" do
    it "should print collumn headers" do
      expect{ subject.statement }.to output("date || credit || debit || balance").to_stdout
    end 
  end
end
