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

    it "should raise error if less than 0.01 is given as amount" do
      expect{ subject.deposit(0) }.to raise_error("That is not a valid amount")
    end

    it "should raise error if more than 2 decimal places" do
      expect{ subject.deposit(1.005) }.to raise_error("That is not a valid amount")
    end
  end

  describe "#withdraw" do
    it "should withdraw an amount" do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.instance_variable_get(:@balance)).to eq(500)
    end

    it "should raise error if less than 0.01 is given as amount" do
      expect{ subject.withdraw(0) }.to raise_error("That is not a valid amount")
    end
  end

  describe "#statement" do
    HEADER = "date || credit || debit || balance"

    before(:each) do
      time = Time.now
      @date = "#{time.day.to_s.rjust(2, "0")}/#{time.month.to_s.rjust(2, "0")}/#{time.year.to_s}"
      allow(Time).to receive(:now).and_return(time)
    end

    it "should print collumn headers" do
      expect{ subject.statement }.to output(HEADER).to_stdout
    end 

    it "should print out a credit after a deposit" do
      subject.deposit(500)
      expect{ subject.statement }.to output("#{HEADER}\n#{@date} || 500.00 || || 500.00").to_stdout
    end

    it "should print out a debit after a deposit" do
      subject.withdraw(500)
      expect{ subject.statement }.to output("#{HEADER}\n#{@date} || || 500.00 || -500.00").to_stdout
    end

    it "should include transactions with the latest at the top" do
      subject.deposit(1000)
      subject.withdraw(500)
      expect{ subject.statement }.to output("#{HEADER}\n#{@date} || || 500.00 || 500.00\n#{@date} || 1000.00 || || 1000.00").to_stdout
    end
  end
end
