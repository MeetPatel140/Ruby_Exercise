require_relative 'checkout'

module CartMethods
  class Cart
    include ItemMethods
    include CheckoutMethods
    attr_accessor :items

    def initialize
      @items = {}
    end

    def self.add_item_to_cart(items, cart)
      Item.list_all_items(items)
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
            cart.delete(selected_item)
          end
        else
          puts "Invalid quantity. Please enter a positive number."
        end
      else
        puts "Invalid item selection."
      end

      true
    end

    def self.view_cart(cart)
      if cart.empty?
        puts "Your cart is empty. Please Add items before checkout!"
        return
      end

      total_amount = 0
      total_qty = 0

      puts "+" + "-" * 20 + "[ Cart ]" + "-" * 14 + "+" + "-" * 6 + "+"
      puts "|".ljust(27) + "|".ljust(16) + "|".ljust(7) + "|"
      puts "|          Items           |     Price     |  Qty |"
      puts "|".ljust(27) + "|".ljust(16) + "|".ljust(7) + "|"
      puts "+--------------------------+---------------+------+"
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

    end
  end
end
