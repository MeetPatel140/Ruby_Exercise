#Implement a method to remove duplicate characters from a string.

def remove_duplicate_chars(string)
  chars = string.chars
  result = []
  chars.each do |char|
    result << char unless result.include?(char)
  end
  result.join("")
end

print "Enter a String: "
input = gets.chomp.to_s
puts remove_duplicate_chars(input)
