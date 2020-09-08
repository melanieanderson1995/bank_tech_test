require "bank"

describe Bank do
  it "creates a bank" do
    expect(Bank.new).to be_a(Bank)
  end

  it "bank starts with 0 balance" do
    expect(subject.balance).to eq 0
  end

  describe "#deposit" do
    it "can deposit an amount" do
      expect(subject.deposit(5)).to eq subject.balance
    end

    it "saves amount of deposit in history" do
      subject.deposit(5)
      expect(subject.history[0][1]).to eq 5
    end
  end

  describe "#withdraw" do
    it "can withdraw an amount" do
      subject.deposit(15)
      expect(subject.withdraw(10)).to eq subject.balance
    end

    it "can't withdraw if amount is more than is deposited" do
      expect{ subject.withdraw(10) }.to raise_error "Balance of £#{subject.balance} is insufficient"
    end

    it "saves amount of withdrawal in history" do
      subject.deposit(20)
      subject.withdraw(5)
      expect(subject.history[1][2]).to eq 5
    end
  end

  it "prints the header" do
    expect(subject.print_header).to eq "date || credit || debit || balance"
  end

  describe "#print statement" do
    it "prints time as a string" do
      subject.deposit(20)
      expect(subject.print_statement[0][0]).to be_a(String)
    end

    it "prints amount" do
      subject.deposit(20)
      expect(subject.print_statement[0][1]).to eq 20
    end

    it "prints balance" do
      subject.deposit(40)
      subject.withdraw(20)
      expect(subject.print_statement[1][2]).to eq 20
    end
  end

end
