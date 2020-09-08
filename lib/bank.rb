# frozen_string_literal: true

# Class creates bank account and functions
class Bank
  attr_reader :balance, :history, :date, :amount

  def initialize(balance = 0)
    @balance = balance
    @history = []
    @date = ''
    @amount = amount
  end

  def date_of_transaction
    time = Time.new
    year = time.year
    month = time.month
    day = time.day
    @date = "#{day}/#{month}/#{year}"
  end

  def record_deposit
    transaction = [@date, amount, nil, balance]
    @history.push(transaction)
  end

  def record_withdraw
    transaction = [@date, nil, amount, balance]
    @history.push(transaction)
  end

  def deposit(amount)
    @amount = amount
    @balance += amount
    date_of_transaction
    record_deposit
    balance
  end

  def withdraw(amount)
    raise "Balance of £#{@balance} is insufficient" if @balance < amount

    @amount = amount
    @balance -= amount
    date_of_transaction
    record_withdraw
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
    header = 'date || credit || debit || balance'
    puts header
    header
  end
end
