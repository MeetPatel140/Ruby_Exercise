require_relative 'cart'

module CheckoutMethods
  class Checkout
    def self.checkout(cart)
      total_amount = 0
      total_qty = 0
      if cart.empty?
        puts "Your cart is empty. Please Add items before checkout !"
        return
      end

      puts "+" + "-" * 20 + "[ Cart ]" + "-" * 14 + "+" + "-" * 6 + "+"
      puts "|".ljust(27) + "|".ljust(16) + "|".ljust(7) + "|"
      puts "|          Items           |     Price     |  Qty |"
      puts "|".ljust(27) + "|".ljust(16) + "|".ljust(7) + "|"
      puts "+---------------------------+--------------+------+"
      puts "|".ljust(27) + "|".ljust(16) + "|".ljust(7) + "|"

      cart.each do |item, quantity|
        amount = item.price * quantity
        total_amount += amount
        total_qty += quantity

        puts "| #{item.name.ljust(25)}| ₨.#{item.price.round(2).to_s.ljust(12)}|  #{quantity.to_s.ljust(4)}|"
        puts "|".ljust(27) + "|".ljust(16) + "|".ljust(7) + "|"
      end

      puts "+--------------------------+---------------+------+"
      puts "|".ljust(27) + "|".ljust(16) + "|".ljust(7) + "|"
      puts "|" + " Total : ".ljust(26) + "|" + " ₨.#{total_amount.round(2)}".ljust(15) + "|" + "  #{total_qty}".ljust(6) + "|"
      puts "|".ljust(27) + "|".ljust(16) + "|".ljust(7) + "|"
      puts "+--------------------------+---------------+------+"
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
  end
end
