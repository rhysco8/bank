require 'bank_account'

RSpec.describe BankAccount do

  before(:each) do
    @account = described_class.new
    @today = Time.now.strftime("%d/%m/%Y")
  end

  describe '#deposit' do
    it 'increases balance by 1' do
      expect { @account.deposit(1) }.to change { @account.balance }.by(1)
    end

    it 'increases balance by 100' do
      expect { @account.deposit(100) }.to change { @account.balance }.by(100)
    end

    it 'records deposit details' do
      @account.deposit(1)
      details = {type: :deposit, amount: 1, balance: 1}
      expect(@account.transactions).to include(details)
    end
  end

  describe '#withdraw' do
    it 'decreases balance by 1' do
      expect { @account.withdraw(1) }.to change { @account.balance }.by(-1)
    end

    it 'decreases balance by 100' do
      expect { @account.withdraw(100) }.to change { @account.balance }.by(-100)
    end

    it 'records withdrawal details' do
      @account.withdraw(1)
      details = {type: :withdrawal, amount: 1, balance: -1}
      expect(@account.transactions).to include(details)
    end
  end

  describe '#print_statement' do
    it 'prints the header' do
      expect { @account.print_statement }.to output("date || credit || debit || balance").to_stdout
    end

    it 'prints a deposit of 1 and the balance' do
      @account.deposit(1)
      expect { @account.print_statement }.to output("date || credit || debit || balance\n#{@today} || 1.00 || || 1.00").to_stdout
    end

    it 'prints a deposit of 100 and the balance' do
      @account.deposit(100)
      expect { @account.print_statement }.to output("date || credit || debit || balance\n#{@today} || 100.00 || || 100.00").to_stdout
    end

    it 'prints a withdrawal of 100 and the balance' do
      @account.withdraw(100)
      expect { @account.print_statement }.to output("date || credit || debit || balance\n#{@today} || || 100.00 || -100.00").to_stdout
    end

    it 'prints transactions in reverse chronological order' do
      @account.deposit(100)
      @account.withdraw(50)
      @account.deposit(200)
      expect { @account.print_statement }.to output("date || credit || debit || balance\n#{@today} || 200.00 || || 250.00\n#{@today} || || 50.00 || 50.00\n#{@today} || 100.00 || || 100.00").to_stdout
    end
  end
end
