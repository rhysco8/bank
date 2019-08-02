# prints list of transactions to STDOUT
module StatementPrinter

  private

  def print_statement(transactions)
    print_header
    print_transactions(transactions)
  end

  def print_header
    print 'date || credit || debit || balance'
  end

  def print_transactions(transactions)
    transactions.each do |transaction|
      puts
      print_as_deposit_or_withdrawal(transaction)
    end
  end

  def print_as_deposit_or_withdrawal(transaction)
    if transaction[:type] == :deposit
      print "#{transaction[:date]} ||"\
      " #{format('%.2f', transaction[:amount])} || ||"\
      " #{format('%.2f', transaction[:balance])}"
    elsif transaction[:type] == :withdrawal
      print "#{transaction[:date]} || ||"\
      " #{format('%.2f', transaction[:amount])} ||"\
      " #{format('%.2f', transaction[:balance])}"
    end
  end
end
