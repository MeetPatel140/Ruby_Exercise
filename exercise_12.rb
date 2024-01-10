#Create a method that merges two hash maps.

hash1 = {'name'=>'MEET','age'=>22,'phone'=>6353877251}
hash2 = {'area'=>'BAPUNAGAR','email'=>'meetsolanki140@gmail.com'}

def merge_hashmap(hmap1, hmap2)
  new_hashmap = {}
  hmap1.each do |key, value|
    new_hashmap[key] = value
  end
  hmap2.each do |key, value|
    new_hashmap[key] = value
  end
  return new_hashmap
end

puts merge_hashmap(hash1,hash2)
