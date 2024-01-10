#Write a function to find the key associated with the maximum value in a hash.

h = {'a'=>10,'b'=>500,'c'=>100}

def max_value(hash)
  max_value = 0
  max_key = 0

  hash.each do |key, value|
    if value > max_value
      max_value = value
      max_key = key
    end
  end
  max_key
end

puts "Max Value's Key is: #{max_value(h)}"
