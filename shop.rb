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
  puts "+" + "-" * 17 + "[ List of Available Items ]" + "-" * 17 + "+"
  puts "|".ljust(8) + "|".ljust(37) + "|".ljust(11) + "|".ljust(6) + "|"
  puts "|  No.  |                 Item               |  Price   | Qty |"
  puts "|".ljust(8) + "|".ljust(37) + "|".ljust(11) + "|".ljust(6) + "|"
  puts "+-------+------------------------------------+----------+-----+"
  puts "|".ljust(8) + "|".ljust(37) + "|".ljust(11) + "|".ljust(6) + "|"

  items.each.with_index(1) do |item, index|
    index_str = index.to_s.ljust(4)
    name_str = item.name.ljust(35)
    price_str = "₨.#{item.price.round(2)}".ljust(9)
    quantity_str = item.quantity.to_s.ljust(4)

    puts "|   #{index_str}| #{name_str}| #{price_str}| #{quantity_str}|"
  end

  puts "|".ljust(8) + "|".ljust(37) + "|".ljust(11) + "|".ljust(6) + "|"
  puts "+-------+------------------------------------+----------+-----+"
end

def add_item_to_cart(items, cart)
  list_all_items(items)
  print "Enter the number of the item you'd like to add to the cart (or 0 to Back): "
  selected_item_index = gets.chomp.to_i - 1

  if selected_item_index == -1
    return false
  elsif selected_item_index >= 0 && selected_item_index < items.length
    selected_item = items[selected_item_index]

    print "Enter the quantity you'd like to add to the cart: "
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
  print "Are your sure you want to Place this order ? (Y/N) : "
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
item1 = Item.new("Smartphone", 899.99, 8)
item2 = Item.new("Camera", 1299.95, 15)
item3 = Item.new("Gaming Laptop", 1899.99, 3)
item4 = Item.new("Wireless Earbuds", 149.99, 20)
item5 = Item.new("Tablet", 499.99, 12)
item6 = Item.new("Fitness Tracker", 79.99, 25)
item7 = Item.new("Bluetooth Speaker", 129.95, 10)
item8 = Item.new("External Hard Drive", 149.99, 7)
item9 = Item.new("Gaming Console", 299.99, 5)
item10 = Item.new("Laptop Stand", 29.99, 30)
item11 = Item.new("Coffee Maker", 69.95, 18)
item12 = Item.new("Desk Chair", 149.99, 15)
item13 = Item.new("Smartwatch", 199.99, 22)
item14 = Item.new("Printer", 199.99, 8)
item15 = Item.new("Backpack", 49.99, 35)
item16 = Item.new("LED Desk Lamp", 39.99, 12)
item17 = Item.new("Power Bank", 29.95, 25)
item18 = Item.new("Mechanical Keyboard", 79.99, 10)
item19 = Item.new("Wireless Mouse", 24.99, 40)
item20 = Item.new("Portable Monitor", 179.99, 6)
item21 = Item.new("Drones", 499.99, 3)
item22 = Item.new("Smart Thermostat", 129.99, 15)
item23 = Item.new("Graphic Drawing Tablet", 199.99, 8)
item24 = Item.new("Noise-Canceling Headphones", 149.99, 20)
item25 = Item.new("Desk Organizer", 19.99, 28)
item26 = Item.new("Digital Camera", 299.99, 10)
item27 = Item.new("Mechanical Pencil Set", 9.95, 50)
item28 = Item.new("Travel Backpack", 59.99, 15)
item29 = Item.new("Portable Projector", 129.99, 7)
item30 = Item.new("Compact Refrigerator", 179.99, 12)
item31 = Item.new("Desk Fan", 19.99, 25)
item32 = Item.new("Wireless Keyboard", 59.99, 18)
item33 = Item.new("Coffee Grinder", 29.95, 15)
item34 = Item.new("Compact Mirrorless Camera", 699.99, 5)
item35 = Item.new("USB-C Hub", 34.99, 30)
item36 = Item.new("Portable Bluetooth Printer", 129.99, 8)
item37 = Item.new("Smart Home Security Camera", 149.99, 12)
item38 = Item.new("Electric Toothbrush", 49.99, 20)
item39 = Item.new("Handheld Vacuum Cleaner", 79.99, 10)
item40 = Item.new("Digital Drawing Pad", 119.99, 15)
item41 = Item.new("Smart Light Bulbs", 14.99, 40)
item42 = Item.new("Adjustable Laptop Stand", 34.99, 25)
item43 = Item.new("Solar Power Bank", 39.99, 18)
item44 = Item.new("Indoor Plants Set", 49.99, 10)
item45 = Item.new("Wireless Charging Pad", 24.99, 30)
item46 = Item.new("Car Jump Starter", 69.99, 12)
item47 = Item.new("Digital Alarm Clock", 19.99, 35)
item48 = Item.new("Home Office Chair", 119.99, 8)
item49 = Item.new("Smart Doorbell", 199.99, 5)
item50 = Item.new("Ergonomic Mouse", 29.99, 22)
item51 = Item.new("Wireless Gaming Mouse", 49.99, 15)
item52 = Item.new("Bluetooth Keyboard", 39.99, 18)
item53 = Item.new("Wireless Charging Stand", 29.99, 25)
item54 = Item.new("Yoga Mat", 19.99, 40)
item55 = Item.new("Digital Voice Recorder", 59.99, 10)
item56 = Item.new("Solar-Powered Lantern", 24.99, 30)
item57 = Item.new("Desk Organizer Set", 29.99, 20)
item58 = Item.new("Cordless Hair Dryer", 79.99, 8)
item59 = Item.new("Mini Projector", 89.99, 15)
item60 = Item.new("Smart Coffee Mug", 34.99, 25)
item61 = Item.new("Portable Bluetooth Speaker", 44.99, 18)
item62 = Item.new("Camping Tent", 79.99, 10)
item63 = Item.new("USB Microphone", 69.99, 12)
item64 = Item.new("Rechargeable LED Flashlight", 14.99, 35)
item65 = Item.new("Wireless Earbud Case", 9.99, 50)
item66 = Item.new("Electric Kettle", 24.99, 20)
item67 = Item.new("Compact Folding Chair", 19.99, 30)
item68 = Item.new("Digital Tire Inflator", 39.99, 15)
item69 = Item.new("Smart Home Thermostat", 129.99, 8)
item70 = Item.new("Portable Blender", 34.99, 22)
item71 = Item.new("Wireless Charging Mouse Pad", 29.99, 18)
item72 = Item.new("Foldable Laptop Desk", 39.99, 25)
item73 = Item.new("Smart Water Bottle", 19.99, 40)
item74 = Item.new("Cord Organizer Box", 14.99, 30)
item75 = Item.new("Wireless Presenter Remote", 24.99, 22)
item76 = Item.new("Air Purifier", 79.99, 12)
item77 = Item.new("Cordless Phone Charger", 34.99, 20)
item78 = Item.new("Compact Binoculars", 49.99, 10)
item79 = Item.new("Memory Foam Seat Cushion", 29.99, 15)
item80 = Item.new("Smart Mirror", 99.99, 8)
item81 = Item.new("Miniature Indoor Fountain", 19.99, 25)
item82 = Item.new("Wireless Charging Alarm Clock", 44.99, 18)
item83 = Item.new("Collapsible Travel Backpack", 34.99, 30)
item84 = Item.new("Portable Hand Warmer", 14.99, 40)
item85 = Item.new("Adjustable Laptop Cooling Pad", 24.99, 20)
item86 = Item.new("Bluetooth Sleep Headphones", 39.99, 15)
item87 = Item.new("Solar-Powered Phone Charger", 29.99, 25)
item88 = Item.new("Inflatable Neck Pillow", 19.99, 35)
item89 = Item.new("Smart Wi-Fi Plug", 9.99, 50)
item90 = Item.new("Reusable Shopping Bags Set", 14.99, 30)
item91 = Item.new("Compact Espresso Machine", 79.99, 12)
item92 = Item.new("Smart Notebook", 34.99, 22)
item93 = Item.new("Portable Handheld Fan", 19.99, 15)
item94 = Item.new("Folding Walking Stick", 29.99, 18)
item95 = Item.new("Cordless Desk Vacuum", 24.99, 25)
item96 = Item.new("Compact UV Sanitizer", 39.99, 8)
item97 = Item.new("Wireless HDMI Adapter", 49.99, 10)
item98 = Item.new("Digital Tape Measure", 14.99, 20)
item99 = Item.new("Compact Wine Opener", 19.99, 30)
item100 = Item.new("Smart Pet Feeder", 89.99, 12)


items = [item1, item2, item3, item4, item5, item6, item7, item8, item9, item10,
         item11, item12, item13, item14, item15, item16, item17, item18, item19, item20,
         item21, item22, item23, item24, item25, item26, item27, item28, item29, item30,
         item31, item32, item33, item34, item35, item36, item37, item38, item39, item40,
         item41, item42, item43, item44, item45, item46, item47, item48, item49, item50,
         item51, item52, item53, item54, item55, item56, item57, item58, item59, item60,
         item61, item62, item63, item64, item65, item66, item67, item68, item69, item70,
         item71, item72, item73, item74, item75, item76, item77, item78, item79, item80,
         item81, item82, item83, item84, item85, item86, item87, item88, item89, item90,
         item91, item92, item93, item94, item95, item96, item97, item98, item99, item100]

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
    print "Enter your choice: "
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
