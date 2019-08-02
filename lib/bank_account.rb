require_relative 'statement_printer'

# Account allows you to deposit, withdraw and print statement
class BankAccount
  include StatementPrinter
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    record_deposit(amount)
  end

  def withdraw(amount)
    @balance -= amount
    record_withdrawal(amount)
  end

  def display_statement
    print_statement(@transactions)
  end

  private

  def record_deposit(amount)
    details = {
      date: Time.now.strftime('%d/%m/%Y'),
      type: :deposit,
      amount: amount,
      balance: @balance
    }
    @transactions.prepend(details)
  end

  def record_withdrawal(amount)
    details = {
      date: Time.now.strftime('%d/%m/%Y'),
      type: :withdrawal,
      amount: amount,
      balance: @balance
    }
    @transactions.prepend(details)
  end
end
