#Write a class representing a basic bank account with methods for deposit and withdrawal.

class Bank
  @@database = {1=>0,2=>100,3=>150,4=>500,5=>1000}

  def deposit(deposit_amount, account_number)
    if @@database.key?(account_number)
      @@database[account_number] += deposit_amount
      puts "\nDeposit was successful!"
      puts "Balance is: Rs.#{@@database[account_number]}"
    else
      puts "\nAccount not Exist!"
    end
  end

  def withdraw(withdraw_amount, account_number)
    if @@database.key?(account_number)
      if @@database[account_number] < withdraw_amount
        puts "\nLow Balance!"
        puts "Balance is: Rs.#{@@database[account_number]}"
      else
        @@database[account_number] -= withdraw_amount
        puts "\nWithdrawal was successful!"
        puts "Balance is: Rs.#{@@database[account_number]}"
      end
    else
      puts "\nAccount Number not Exist!"
    end
  end
end

loop do
  puts "\nEnter (1) to Deposit"
  puts "Enter (2) to Withdraw"
  puts "Enter (0) to Exit"
  print "Choose your Operation: "
  choose_input = gets.chomp.to_i

  bank_account = Bank.new

  case choose_input
  when 1
    print "Enter Amount to Deposit: Rs."
    deposit_amount = gets.chomp.to_f
    print "Enter Account Number: #"
    account_number = gets.chomp.to_i
    bank_account.deposit(deposit_amount, account_number)
  when 2
    print "Enter Amount to Withdraw: Rs."
    withdraw_amount = gets.chomp.to_f
    print "Enter Account number: #"
    account_number = gets.chomp.to_i
    bank_account.withdraw(withdraw_amount, account_number)
  when 0
    puts "\nExiting the program. Goodbye!"
    break
  else
    puts "\nInvalid Input !!!"
  end
end
