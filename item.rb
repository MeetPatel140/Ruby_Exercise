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
