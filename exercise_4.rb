#Write a function to count the number of vowels in a string.
def count_vowels(string)
  count = 0
  string.each_char do |char|
    if char == "a" || char == "e" || char == "i" || char == "o" || char == "u"
      count += 1
    end
  end
  if count == 0
    "No Vowels Found !"
  elsif count > 0
    "#{count} Vowel(s) Found!"
  end
end

print "Enter any String: "
input = gets.chomp.to_s
puts count_vowels(input)
