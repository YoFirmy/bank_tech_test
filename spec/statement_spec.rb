require 'statement'

HEADER = "date || credit || debit || balance\n"

describe Statement do
  before(:each) do
    time = Time.now
    @date = "#{time.day.to_s.rjust(2, "0")}/#{time.month.to_s.rjust(2, "0")}/#{time.year}"
    allow(Time).to receive(:now).and_return(time)
  end

  describe '#display' do
    it "should print collumn headers" do
      expect { subject.display }.to output(HEADER).to_stdout
    end 
  end

  it "should print out a credit after a deposit" do
    subject.update(credit: 500, balance: 500)
    expect { subject.display }.to output("#{HEADER}#{@date} || 500.00 || || 500.00").to_stdout
  end

  it "should print out a debit after a withdrawal" do
    subject.update(debit: 500, balance: -500)
    expect { subject.display }.to output("#{HEADER}#{@date} || || 500.00 || -500.00").to_stdout
  end

  it "should include transactions with the latest at the top" do
    subject.update(credit: 1000, balance: 1000)
    subject.update(debit: 500, balance: 500)
    expect { subject.display }.to output("#{HEADER}#{@date} || || 500.00 || 500.00\n#{@date} || 1000.00 || || 1000.00").to_stdout
  end
end
