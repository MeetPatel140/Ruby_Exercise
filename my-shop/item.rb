require_relative 'data'

module ItemMethods
  class Item
    include ItemData
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

    def self.list_all_items(items)
      puts ""
      puts "+" + "-" * 20 + "[ List of Available Items ]" + "-" * 20 + "+"
      puts "|".ljust(8) + "|".ljust(37) + "|".ljust(17) + "|".ljust(6) + "|"
      puts "|  No.  |                 Item               |     Price      | Qty |"
      puts "|".ljust(8) + "|".ljust(37) + "|".ljust(17) + "|".ljust(6) + "|"
      puts "+-------+------------------------------------+----------------+-----+"
      puts "|".ljust(8) + "|".ljust(37) + "|".ljust(17) + "|".ljust(6) + "|"

      if items
        items.each.with_index(1) do |item, index|
          name_str = item.name.ljust(35)
          index_str = index.to_s.ljust(4)
          price_str = "₨.#{item.price.round(2)}".ljust(15)
          quantity_str = item.quantity.to_s.ljust(4)

          puts "|   #{index_str}| #{name_str}| #{price_str}| #{quantity_str}|"
        end
      else
        puts "|".ljust(8) + "|".ljust(5) + "No Items Available!".center(32) + "|".ljust(17) + "|".ljust(6) + "|"
      end
      puts "|".ljust(8) + "|".ljust(37) + "|".ljust(17) + "|".ljust(6) + "|"
      puts "+-------+------------------------------------+----------------+-----+"
    end
  end
end
