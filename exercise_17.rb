#Define a Person class with attributes for name and age.
class Person
  attr_reader :name, :age
  def initialize(name, age)
    @name = name
    @age = age
  end
  def myself
    "#{@name} is #{@age} years old."
  end
end

person = Person.new("Meet Solanki",22)
puts person.myself
