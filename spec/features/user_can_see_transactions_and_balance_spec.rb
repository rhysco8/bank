require 'bank_account'

RSpec.describe 'User can view transaction history on bank statement print out' do
  it 'displays deposits, withdrawals and balance in reverse chronological order' do
    account = BankAccount.new
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)

    header = "credit || debit || balance"
    first = "1000 || || 1000"
    second = "2000 || || 3000"
    third = " || 500 || 2500"

    expect { account.print_statement }.to output("#{header}\n#{third}\n#{second}\n#{first}").to_stdout
  end
end
