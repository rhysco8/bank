require 'bank_account'

RSpec.describe BankAccount do

  before(:each) do
    @account = described_class.new
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
      expect { @account.print_statement }.to output("credit || debit || balance").to_stdout
    end

    it 'prints a deposit of 1 and the balance' do
      @account.deposit(1)
      expect { @account.print_statement }.to output("credit || debit || balance\n1 || || 1").to_stdout
    end

    it 'prints a deposit of 100 and the balance' do
      @account.deposit(100)
      expect { @account.print_statement }.to output("credit || debit || balance\n100 || || 100").to_stdout
    end

    it 'prints a withdrawal of 100 and the balance' do
      @account.withdraw(100)
      expect { @account.print_statement }.to output("credit || debit || balance\n || 100 || -100").to_stdout
    end

    it 'prints transactions in reverse chronological order' do
      @account.deposit(100)
      @account.withdraw(50)
      @account.deposit(200)
      expect { @account.print_statement }.to output("credit || debit || balance\n200 || || 250\n || 50 || 50\n100 || || 100").to_stdout
    end
  end
end
