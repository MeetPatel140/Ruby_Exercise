#Implement a function that checks if a string is a palindrome.

def is_palindrome(word)
  if word.length == 1 || word.length == 0
    puts "#{$input} is Palindrome."
  else
    if word[0] == word[-1]
      is_palindrome(word[1..-2])
    else
      puts "#{$input} is Not Palindrome!"
    end
  end
end

print "Enter any word: "
$input = gets.chomp.to_s
puts is_palindrome($input)
