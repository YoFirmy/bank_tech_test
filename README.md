# Bank Program

This is a program for interacting with a bank account.

## Set up
Once you have Forked/Cloned this repo run:
```
> bundle
```
Check the [How to use](#how-to-use) section for further details on how to interact with the program.

## Running tests
Run:
```
% rspec
```

## Running linting
Run:
```
% rubocop
```

## How to use
This program runs in the command line, to start simply open up irb and run:
```
> require './lib/bank_account.rb'
```
You will then need to create an BankAccount. It is best if you save one to memory by storing it in a variable:
```
> account = BankAccount.new
```
You can then deposit an amount:
```
> account.deposit(1000)
```
You can also withdraw an amount:
```
> account.withdraw(250)
```
And you can view a statement:
```
> account.statement
 => date || credit || debit || balance
    31/08/2021 || || 250.00 || 750.00
    31/08/2021 || 1000.00 || || 1000.00
```
