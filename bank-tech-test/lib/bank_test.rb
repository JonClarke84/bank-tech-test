class Bank
  def initialize
    @balance = 0
    @transactions = []
  end

  def transaction(amount, date) #where the user inputs money and dates
    @balance += amount
    @transactions << transaction = {amount: amount,
                                    date: date,
                                    new_balance: @balance
                                   }
  end

  def statement #format the transactions history
    output = ""
    @transactions.reverse.each do |transaction|
    output += "#{transaction[:date]}||#{transaction[:amount]}||#{transaction[:new_balance]}\n"
    end
    return output
  end
end