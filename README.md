# Purpose and Requirements #
Create a banking program that allows deposits, withdrawals, and is able to print a bank statement to the terminal

Requirements:
* Deposit
* Withdrawal
* Bank statement (date, amount (credit or debit), balance) printing
* Data can be kept in memory

![Alt text](/public/bank_tech_test.jpg?raw=true "Screenshot")

## Approach ##
* Set up and overall process: Read over requirements -> wrote user stories -> initialized files -> began programming -> updated README.md -> finished programming -> updated README.md
* Programming: TDD'd using feature tests in irb primarily -> writing basic unit tests -> writing Ruby code -> updating unit tests with periodic feature testing

## Structure ##
Followed recommended naming conventions, names are clear, concise, and descriptive. Similar methods are grouped together for readability, as are similar tests. Private methods are not tested for, all other methods are tested for.

## How to run and install ##
In your terminal, input:
* "$ rspec --init" this creates a spec and spec_helper file
* "$ bundle init" this creates a gemfile
* Add rspec, rubocop, and simplecov gems to Gemfile
* "$ bundle install" to install the necessary gems

## How to run the tests ##
To run the test in irb, input "$ irb" in your terminal
To run RSpec, input "$ rspec" in your terminal

## User Stories ##
As a user,
so that I can have a bank account,
I want to be able to create a bank account with a balance of 0

As a user,
so that I can store money,
I want to be able to deposit/credit an amount and have it change the bank account balance

As a user,
so that I can get money,
I want to be able to withdraw/debit money and have it change the bank account balance

As a user,
so that I don't pull out too much money,
I want it to let me know if I have insufficient funds for withdrawal

As a user,
so that I can keep track of my money,
I want to be able to print a statement with the date, amount, and bank account balance

As a user,
so that I can understand my statement,
I want the statement to have a header so I know which section is which

As a user,
So I can see my most recent transaction easily,
I want the statement to show the most recent transaction first
