#Create a method to check if a specific key is present in a hash.

h = {'a'=>10,'b'=>50,'c'=>100,'d'=>200}
k = 'b'

def has_key(hash, key)
  if hash.has_key?(key)
    "#{key} is present in Hash"
  else
    "#{key} is Not present in Hash"
  end
end

puts has_key(h,k)
