#Create a method that capitalizes the first letter of each word in a sentence.

def capitalizer(string)
  string.split(" ").map{|word| word.capitalize}.join(" ")
end

print "Enter a Simple Sentance: "
input = gets.chomp.to_s
puts capitalizer(input)
