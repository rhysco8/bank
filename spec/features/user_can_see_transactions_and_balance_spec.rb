require 'bank_account'

RSpec.describe 'User can view transaction history on bank statement print out' do
  it 'displays deposits, withdrawals and balance' do
    account = BankAccount.new
    account.deposit(1000)
    account.withdraw(600)
    account.deposit(100)

    header = "date || credit || debit || balance"
    first = "1000 || || 1000"
    second = " || 600 || 400"
    third = "100 || || 500"

    expect { account.print_statement }.to output("#{header}\n#{first}\n#{second}\n#{third}").to_stdout
  end
end
