class Bank
  attr_reader :balance, :history, :date

  def initialize(balance = 0)
    @balance = balance
    @history = []
    @date = ""
  end

  def date_of_transaction
    time = Time.new
    year = time.year
    month = time.month
    day = time.day
    @date = "#{day}/#{month}/#{year}"
  end

  def deposit(amount)
    @balance += amount
    date_of_transaction
    transaction = [@date, amount, nil, @balance]
    @history.push(transaction)
    balance
  end

  def withdraw(amount)
    fail "Balance of £#{@balance} is insufficient" if (@balance < amount)
    @balance -= amount
    date_of_transaction
    transaction = [@date, nil, amount, @balance]
    @history.push(transaction)
    balance
  end

  def print_statement
    print_header
    create_statement
  end

  def create_statement
    history.each do |amount|
      puts "#{amount[0]} || #{amount[1]} || #{amount[2]} || #{amount[3]}"
    end
  end

  def print_header
    header = "date || credit || debit || balance"
    puts header
    header
  end
end
