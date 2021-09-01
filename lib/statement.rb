class Statement
  HEADER = "date || credit || debit || balance\n"

  def initialize
    @transactions = []
  end

  def update(credit: nil, debit: nil, balance:)
    date = format_date
    credit_or_debit = get_credit_or_debit(credit, debit)
    @transactions.insert(0, "#{date} || #{credit_or_debit} || #{format('%.2f', balance)}")
  end

  def display
    print HEADER + @transactions.join("\n")
  end

  private

  def format_date
    time = Time.now
    "#{time.day.to_s.rjust(2, '0')}/#{time.month.to_s.rjust(2, '0')}/#{time.year}"
  end

  def get_credit_or_debit(credit, debit)
    credit ? "#{format('%.2f', credit)} ||" : "|| #{format('%.2f', debit)}"
  end
end
