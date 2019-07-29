# Bank tech test

Creating a simple banking program that runs in IRB. It allows you to deposit and withdraw from an account and print an account statement to the screen.

## How to run

### Download

```sh
$ cd path/to/project/folder
$ git clone git@github.com:rhysco8/bank.git
$ cd bank
```

### Run tests

```sh
$ rspec
```

### Run program

```sh
$ irb -r './lib/bank_account'
```

## Approach

I'll implement features in this order:
1. Deposit and withdrawals change balance
2. Transactions are logged
3. Statement print out displays credit, debit and balance
4. Statement print out is in reverse chronological order
5. Transaction date is logged
6. Statement print out also displays date

## Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
