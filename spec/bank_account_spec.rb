require 'bank_account'

HEADER = "date || credit || debit || balance\n"

describe BankAccount do
  let(:statement) { double :statement, update: "updated!" }
  subject { described_class.new(statement: statement)}

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
      expect { subject.deposit(0) }.to raise_error("That is not a valid amount")
    end

    it "should raise error if more than 2 decimal places" do
      expect { subject.deposit(1.005) }.to raise_error("That is not a valid amount")
    end
  end

  describe "#withdraw" do
    it "should withdraw an amount" do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.instance_variable_get(:@balance)).to eq(500)
    end

    it "should raise error if less than 0.01 is given as amount" do
      expect { subject.withdraw(0) }.to raise_error("That is not a valid amount")
    end
  end

  describe "#statement" do
    it "should call display on statement" do
      expect(statement).to receive(:display)
      subject.statement
    end
  end
end
