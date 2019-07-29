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
    print_header
    print_transactions
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

  def print_header
    print 'credit || debit || balance'
  end

  def print_transactions
    @transactions.each do |transaction|
      puts
      print_as_deposit_or_withdrawal(transaction)
    end
  end

  def print_as_deposit_or_withdrawal(transaction)
    if transaction[:type] == :deposit
      print "#{transaction[:amount]} || || #{transaction[:balance]}"
    elsif transaction[:type] == :withdrawal
      print " || #{transaction[:amount]} || #{transaction[:balance]}"
    end
  end
end
