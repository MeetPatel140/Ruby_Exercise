#Implement a method to remove a key-value pair from a hash.

h = {'a'=>10,'b'=>50,'c'=>100}
k = 'b'

def delete_from_hash(hash, key)
  hash.delete(key)
  hash
end

puts delete_from_hash(h,k)
