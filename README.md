# Bank Program

This is a program for interacting with a bank account.

## Set up
This program runs in the command line. Once you have Forked/Cloned this repo, simply open up irb and run:
```
> require './lib/bank_account.rb'
```
Check the [How to use](#how-to-use) section for further details on how to interact with the program.

## Running-tests
Run:
```
% rspec
```

## How to use
Once you have opened irb and required the correct file (shown in [Set up](#set-up)), you will then need to create an BankAccount. It is best if you save one to memory by storing it in a variable:
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
