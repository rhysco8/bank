require 'bank_account'

RSpec.describe 'User can view transaction history on statement print out' do
  it 'displays date, transactions and balance in reverse chronological order' do
    account = BankAccount.new
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    today = Time.now.strftime('%d/%m/%Y')

    header = 'date || credit || debit || balance'
    first = "#{today} || 1000.00 || || 1000.00"
    second = "#{today} || 2000.00 || || 3000.00"
    third = "#{today} || || 500.00 || 2500.00"

    expect { account.print_statement }.to output(
      "#{header}\n#{third}\n#{second}\n#{first}"
    ).to_stdout
  end
end
