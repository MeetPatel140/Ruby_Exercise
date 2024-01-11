#Create a Book class with methods to set and get its title, author, and publication year.

class Book

  attr_accessor :title, :author, :year

  def initialize(title,author,publication)
    @title = title
    @author = author
    @publication = publication
  end
end

book = Book.new("Avengers Endgame","Marvel",2022)

puts
puts book.title
puts book.author
puts book.publication
puts
book.title = "Black Panther"
book.author = "Marvel"
book.publication = 2021

puts book.title
puts book.author
puts book.publication
