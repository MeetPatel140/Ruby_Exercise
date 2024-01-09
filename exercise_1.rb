#Write a method to reverse a given string.

def reverse_string(string)
  string.reverse
end

print "Enter any String: "
input = gets.chomp
reverse_string(input)
