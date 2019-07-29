class BankAccount
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

  def print_statement
    print 'credit || debit || balance'
    @transactions.each do |transaction|
      puts
      print transaction
    end
  end

  private

  def record_deposit(amount)
    details = {
      type: :deposit,
      amount: amount,
      balance: @balance
    }
    @transactions.push(details)
  end

  def record_withdrawal(amount)
    details = {
      type: :withdrawal,
      amount: amount,
      balance: @balance
    }
    @transactions.push(details)
  end
end
