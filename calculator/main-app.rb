require_relative 'addition'
require_relative 'subtraction'
require_relative 'division'
require_relative 'multiplication'

class MyApp
  include AdditionModule
  include SubtractionModule
  include DivisionModule
  include MultiplicaitonModule

  def MyApp.start
    loop do
      MyApp.display_menu
      input = gets.chomp.to_i
      case input
      when 1
        Addition.start
      when 2
        Subtraction.start
      when 3
        Division.start
      when 4
        Multiplicaiton.start
      when 0
        puts ""
        puts "Good Bye !"
        exit
      else
        puts ""
        puts "Invalid input !"
        start
      end
    end
  end

  def MyApp.display_menu
    puts ""
    puts "1. Addition"
    puts "2. Subtraction"
    puts "3. Division"
    puts "4. Multiplication"
    puts "0. Exit"
    puts "Enter your choice: "
  end
end

MyApp.start
