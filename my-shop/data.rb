require_relative 'item'

module ItemData
  class Data
    def self.item_list
      [
        {name: "Smartphone", price: 899.99, quantity: 8},
        {name: "Camera", price: 1299.95, quantity: 15},
        {name: "Gaming Laptop", price: 1899.99, quantity: 3},
        {name: "Wireless Earbuds", price: 149.99, quantity: 20},
        {name: "Tablet", price: 499.99, quantity: 12}
      ]
    end
  end
end
