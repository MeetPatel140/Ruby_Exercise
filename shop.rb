# Shopping CLI:
# create a command-line shopping app where users can see the available items, can add particular item in the cart, and can buy that product.

class Item
  attr_accessor :name, :price, :quantity

  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
  end

  def buy(quantity)
    if quantity <= @quantity
      @quantity -= quantity
      puts "You bought #{quantity} #{name}(s) for ₨.#{quantity * price}."
    else
      puts "Insufficient quantity of #{name} available."
    end
  end
end

def list_all_items(items)
  puts ""
  puts "+" + "-" * 13 + "[ List of Available Items ]" + "-" * 13 + "+"
  puts "|".ljust(8) + "|".ljust(29) + "|".ljust(11) + "|".ljust(6) + "|"
  puts "|  No.  |             Item           |  Price   | Qty |"
  puts "|".ljust(8) + "|".ljust(29) + "|".ljust(11) + "|".ljust(6) + "|"
  puts "+-------+----------------------------+----------+-----+"
  puts "|".ljust(8) + "|".ljust(29) + "|".ljust(11) + "|".ljust(6) + "|"

  items.each.with_index(1) do |item, index|
    index_str = index.to_s.ljust(4)
    name_str = item.name.ljust(27)
    price_str = "₨.#{item.price.round(2)}".ljust(9)
    quantity_str = item.quantity.to_s.ljust(4)

    puts "|   #{index_str}| #{name_str}| #{price_str}| #{quantity_str}|"
  end

  puts "|".ljust(8) + "|".ljust(29) + "|".ljust(11) + "|".ljust(6) + "|"
  puts "+-------+----------------------------+----------+-----+"
end

def add_item_to_cart(items, cart)
  list_all_items(items)
  puts "Enter the number of the item you'd like to add to the cart (or 0 to Back): "
  selected_item_index = gets.chomp.to_i - 1

  if selected_item_index == -1
    return false
  elsif selected_item_index >= 0 && selected_item_index < items.length
    selected_item = items[selected_item_index]

    puts "Enter the quantity you'd like to add to the cart: "
    quantity = gets.chomp.to_i

    if quantity > 0
      cart[selected_item] ||= 0
      if quantity <= selected_item.quantity
        cart[selected_item] += quantity
        selected_item.buy(quantity)
      else
        puts "Insufficient quantity of #{selected_item.name} available."
      end
    else
      puts "Invalid quantity. Please enter a positive number."
    end
  else
    puts "Invalid item selection."
  end

  true
end

def checkout(cart)
  total_amount = 0
  total_qty = 0
  if cart.empty?
    puts "Your cart is empty. Please Add items before checkout !"
    return
  end

  puts "+" + "-" * 18 + "[ Cart ]" + "-" * 11 + "+" + "-" * 6 + "+"
  puts "|".ljust(27) + "|".ljust(11) + "|".ljust(7) + "|"
  puts "|            Items         |  Price   |  Qty |"
  puts "|".ljust(27) + "|".ljust(11) + "|".ljust(7) + "|"
  puts "+--------------------------+----------+------+"
  puts "|".ljust(27) + "|".ljust(11) + "|".ljust(7) + "|"

  cart.each do |item, quantity|
    amount = item.price * quantity
    total_amount += amount
    total_qty += quantity

    puts "| #{item.name.ljust(25)}| ₨.#{item.price.round(2).to_s.ljust(7)}|  #{quantity.to_s.ljust(4)}|"
    puts "|".ljust(27) + "|".ljust(11) + "|".ljust(7) + "|"
  end

  puts "+--------------------------+----------+------+"
  puts "|".ljust(27) + "|".ljust(11) + "|".ljust(7) + "|"
  puts "|" + " Total : ".ljust(26) + "|" + " ₨.#{total_amount.round(2)}".ljust(10) + "|" + "  #{total_qty}".ljust(6) + "|"
  puts "|".ljust(27) + "|".ljust(11) + "|".ljust(7) + "|"
  puts "+--------------------------+----------+------+"
  puts ""
  puts "Are your sure you want to Place this order ? (Y/N) : "
  confirmation = gets.chomp.downcase
  if confirmation == "y" || confirmation == "yes"
    order_number = rand(0..100)
    cart.clear
    puts "-" * 46
    puts "|" + " Order Number: ##{order_number} ".center(44) + "|"
    puts "-" * 46
    puts "Thank you for shopping with us. Your order has been placed !"
  else
    puts "Your order has been cancelled."
  end
end

def view_cart(cart)
  if cart.empty?
    puts "Your cart is empty. Please Add items before checkout!"
    return
  end

  total_amount = 0
  total_qty = 0

  puts "+" + "-" * 18 + "[ Cart ]" + "-" * 11 + "+" + "-" * 6 + "+"
  puts "|".ljust(27) + "|".ljust(11) + "|".ljust(7) + "|"
  puts "|          Items           |  Price   |  Qty |"
  puts "|".ljust(27) + "|".ljust(11) + "|".ljust(7) + "|"
  puts "+--------------------------+----------+------+"
  puts "|".ljust(27) + "|".ljust(11) + "|".ljust(7) + "|"

  cart.each do |item, quantity|
    amount = item.price * quantity
    total_amount += amount
    total_qty += quantity

    puts "| #{item.name.ljust(25)}| ₨.#{item.price.round(2).to_s.ljust(7)}|  #{quantity.to_s.ljust(4)}|"
    puts "|".ljust(27) + "|".ljust(11) + "|".ljust(7) + "|"
    puts "+--------------------------+----------+------+"
    puts "|".ljust(27) + "|".ljust(11) + "|".ljust(7) + "|"
    puts "|" + " Total : ".ljust(26) + "|" + " ₨.#{total_amount.round(2)}".ljust(10) + "|" + "  #{total_qty}".ljust(6) + "|"
    puts "|".ljust(27) + "|".ljust(11) + "|".ljust(7) + "|"
    puts "+--------------------------+----------+------+"
    puts ""
  end
end

# Sample items with prices and quantities
item1 = Item.new("Laptop", 69799, 5)
item2 = Item.new("Mobile", 19999, 10)
item3 = Item.new("Charger", 250, 20)

items = [item1, item2, item3]

def main(items)
  cart = {}

  loop do
    puts "\n" + "+" + "-" * 11 + "[ Main Menu ]" + "-" * 12 + "+"
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
    puts "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
      list_all_items(items)
    when 2
      loop do
        break unless add_item_to_cart(items, cart)
      end
    when 3
      view_cart(cart)
    when 4
      checkout(cart)
    when 0
      puts "Thank You! (Exiting...)"
      exit
    else
      puts "Please enter a valid option between 1 to 4 only."
    end
  end
end

main(items)
