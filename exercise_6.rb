#Write a function to find the maximum element in an array.

def array_max(string)
  string = string.split(" ")
  count = 0
  string.each do
    count += 1
 end
 puts "There are Maximum " + "#{count}" + " elements in your String."
end

print "Enter any String: "
input = gets.chomp.to_s
puts array_max(input)
