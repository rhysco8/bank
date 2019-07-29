require 'bank_account'

describe BankAccount do
  describe '#deposit' do
    it 'increases balance by 1' do
      account = BankAccount.new
      expect { account.deposit(1) }.to change { account.balance }.by(1)
    end
  end
end
