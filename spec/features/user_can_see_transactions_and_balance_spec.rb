require 'bank_account'

RSpec.describe 'User can view transaction history on bank statement print out' do
  it 'displays deposits, withdrawals and balance' do
    account = BankAccount.new
    account.deposit(1000)
    account.withdraw(600)
    account.deposit(200)

    expect { account.print_statement }.to output('date || credit || debit || balance').to_stdout
  end
end
