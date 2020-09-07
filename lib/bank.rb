class Bank
  attr_reader :balance, :history

  def initialize(balance = 0)
    @balance = balance
    @history = []
  end

  def deposit(amount)
    @balance += amount
    balance = @balance
    time = Time.new
    year = time.year
    month = time.month
    day = time.day
    transaction = ["#{day}/#{month}/#{year}", amount, balance]
    @history.push(transaction)
    balance
  end

  def withdraw(amount)
    fail "Balance of £#{@balance} is insufficient" if (@balance < amount)
    #fail "Balance cannot exceed £#{UPPER_LIMIT}" if (@balance += amount) > UPPER_LIMIT
    @balance -= amount
    balance = @balance
    time = Time.new
    year = time.year
    month = time.month
    day = time.day
    transaction = ["#{day}/#{month}/#{year}", amount, balance]
    @history.push(transaction)
    balance
  end

  def print_statement
    print_header
    create_statement
  end

  def create_statement
    history.each do |amount|
      puts "#{amount[0]}" + " || " + "#{amount[1]}" + " || " + "#{amount[2]}"
    end
  end

  def print_header
    header = "date || amount || balance"
    puts header
    header
  end
end
