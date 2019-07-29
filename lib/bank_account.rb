class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def print_statement
    print 'credit || debit || balance'
    @transactions.each do |transaction|
      puts
      print transaction
    end
  end
end
