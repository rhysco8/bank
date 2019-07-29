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
$ irb -I . -r 'lib/bank_account'
```

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

## Approach

I'll implement features in this order:
1. Deposit and withdrawals change balance
2. Statement print out displays credit, debit and balance
3. Statement print out is in reverse chronological order
4. Amounts in statement print out are to 2 decimal places
5. Transaction date is logged
6. Statement print out also displays date

### User stories

I created User stories for each step of implementation

#### 1. Deposit and withdrawals change balance

```
As a User,
So that I can have money in my account,
I want to be able to deposit an amount.

As a User,
So that I can spend cash,
I want to be able to withdraw money from my account.

As a User,
So that I have a way of tracking how much money is in my account,
I want my account balance to be recorded.
```

#### 2. Statement print out displays credit, debit and balance

```
As a User,
So that I can keep track of deposits and withdrawals,
I want my transactions to be recorded.

As a User,
So that I can see my transactions and how they affected my balance,
I want to be able to print my account statement.
```

#### 3. Statement print out is in reverse chronological order

```
As a User,
So that I can see my most recent transactions first,
I want my account statement print out to be in reverse chronological order.
```

#### 4. Amounts in statement print out are to 2 decimal places

```
As a User,
So that I can see exact currency amounts,
I want to see all amounts listed to 2 decimal places.
```

#### 5. Transaction date is logged

```
As a User,
So that I can keep track of when I've made deposits and withdrawals,
I want the date of my transactions to be recorded.
```

#### 6. Statement print out also displays date

```
As a User,
So that I can see when my transactions took place,
I want my account statement print out to include the date of each transaction.
```
