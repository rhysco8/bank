require 'bank_account'

RSpec.describe "Deposit and withdraw from account" do
  it "display balance of 400 after depositing 1000 and withdrawing 600" do
    account = BankAccount.new
    account.deposit(1000)
    account.withdraw(600)

    expect(account.balance).to eq(400)
  end
end
