require 'bank_test'

RSpec.describe Bank do
  context 'given a starting balance of 0' do
    it 'returns a balance of 0' do
      bank = Bank.new
      bank.transaction(0, "10-01-2023")
      expect(bank.statement).to eq "10-01-2023||0||0\n"
    end

    it 'given a transaction of 1000 on 10-01-2023, it returns the amount and date' do
      bank = Bank.new
      bank.transaction(1000, "10-01-2023")
      expect(bank.statement).to eq "10-01-2023||1000||1000\n"
    end

    it 'given two transactions, it returns transaction history' do
      bank = Bank.new
      bank.transaction(1000, "10-01-2023")
      bank.transaction(2000, "13-01-2023")
      expect(bank.statement).to eq "13-01-2023||2000||3000\n" +
                                   "10-01-2023||1000||1000\n"
    end

    it 'given two transactions, it returns transaction history' do
      bank = Bank.new
      bank.transaction(1000, "10-01-2023")
      bank.transaction(2000, "13-01-2023")
      bank.transaction(-500, "14-01-2023")
      expect(bank.statement).to eq "14-01-2023||-500||2500\n" +
                                   "13-01-2023||2000||3000\n" +
                                   "10-01-2023||1000||1000\n"
    end

  end
  
end