# frozen_string_literal: true

require './lib/bank'

describe Bank do
  it 'creates a bank' do
    expect(Bank.new).to be_a(Bank)
  end

  it 'bank starts with 0 balance' do
    expect(subject.balance).to eq 0
  end

  describe '#date_of_transaction' do
    it 'returns a date for a transaction' do
      subject.deposit(5.00)
      expect(subject.history[0][0]).to be_a(String)
    end
  end

  describe '#deposit' do
    it 'can deposit an amount' do
      expect(subject.deposit(5.00)).to eq subject.balance
    end

    it 'saves amount of deposit in history' do
      subject.deposit(5.00)
      expect(subject.history[0][1]).to eq 5.0
    end
  end

  describe '#withdraw' do
    it 'can withdraw an amount' do
      subject.deposit(15.00)
      expect(subject.withdraw(10.00)).to eq subject.balance
    end

    it "can't withdraw if amount is more than is deposited" do
      expect { subject.withdraw(10.00) }.to raise_error "Balance of £#{subject.balance} is insufficient"
    end

    it 'saves amount of withdrawal in history' do
      subject.deposit(20.00)
      subject.withdraw(5.00)
      expect(subject.history[1][2]).to eq 5.0
    end
  end

  it 'prints the header' do
    expect(subject.print_header).to eq 'date || credit || debit || balance'
  end

  describe '#print statement' do
    it 'prints time as a string' do
      subject.deposit(20.00)
      expect(subject.print_statement[0][0]).to be_a(String)
    end

    it 'prints amount' do
      subject.deposit(20.00)
      expect(subject.print_statement[0][1]).to eq 20.0
    end

    it 'prints balance' do
      subject.deposit(40.00)
      subject.withdraw(20.00)
      expect(subject.print_statement[0][2]).to eq 20.0
    end
  end
end
