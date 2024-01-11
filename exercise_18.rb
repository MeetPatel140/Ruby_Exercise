# Create a Car class with methods for starting and stopping the engine

class Car
  def start
    puts "Wroom..Wroom.. Engine Started !"
  end
  def stop
    puts "Khash... Engine Stopped !"
  end
end

car = Car.new
print "Enter 1 to Start Engine & 0 to Stop Engine: "
input = gets.chomp.to_i
input == 1 ? "#{car.start}": "#{car.stop}"
