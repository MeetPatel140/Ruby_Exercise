require_relative 'item'
require_relative 'cart'
require_relative 'checkout'
require_relative 'data'

class MainApp
  include ItemMethods
  include CartMethods
  include CheckoutMethods
  include ItemData

  def initialize
    @items = Data.item_list
    @cart = Cart.new
  end

  def self.start
    loop do
      MainApp.display_menu
      choice = gets.chomp.to_i
      MainApp.process_choice(choice)
    end
  end

  def self.display_menu
    puts @items
    puts "\n+" + "-" * 11 + "[ Main Menu ]" + "-" * 12 + "+"
    puts "|".ljust(37) + "|"
    puts "|" + " " * 5 + "What would you like to do ?".ljust(30) + " |"
    puts "|".ljust(37) + "|"
    puts "+" + "-" * 36 + "+"
    puts "|".ljust(37) + "|"
    puts "|" + " " * 3 + "1. See Available Items".ljust(30) + " " * 3 + "|"
    puts "|" + " " * 3 + "2. Add Item to Cart".ljust(30) + " " * 3 + "|"
    puts "|" + " " * 3 + "3. View Cart".ljust(30) + " " * 3 + "|"
    puts "|" + " " * 3 + "4. Checkout".ljust(30) + " " * 3 + "|"
    puts "|" + " " * 3 + "0. Exit".ljust(30) + " " * 3 + "|"
    puts "|".ljust(37) + "|"
    puts "+" + "-" * 36 + "+"
    puts ""
    print "Enter your choice: "
  end

  def self.process_choice(choice)
    case choice
    when 1
      Item.list_all_items(@items)
    when 2
      Cart.add_item_to_cart(@items, @cart)
    when 3
      Cart.view_cart(@cart)
    when 4
      Checkout.checkout(@cart)
    when 0
      puts "Thank You! (Exiting...)"
      exit
    else
      puts "Please enter a valid option between 1 to 4 only."
    end
  end
end


# app = MainApp.new(items)
# app.start

MainApp.start
