require 'bank_account'

describe BankAccount do

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
  end

  describe '#withdraw' do
    it 'decreases balance by 1' do
      expect { @account.withdraw(1) }.to change { @account.balance }.by(-1)
    end
  end
end
