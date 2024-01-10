#Write a function that converts a hash to an array of its keys.

h = {'a'=>10,'b'=>50,'c'=>100,'d'=>200}

def convert_key_to_array(hash)
  arr = hash.keys.to_a
  arr
end

puts convert_key_to_array(h)
