#Write a method to rotate the elements of an array to the left by a given number of positions.

arr = [1,2,3,4,5]

def rotate_array(arr,position)
  position %= arr.length

  rotated =  arr.drop(position) + arr.take(position)
end

rotated_array = rotate_array(arr,2)

puts "Original Array: #{arr}"
puts "Array rotated left by 2 position: #{rotated_array}"
