#Write a method to rotate the elements of an array to the left by a given number of positions.

arr = [1,2,3,4,5]

def rotate_array(arr,position)
  position.times do
    arr.push(arr.shift)
  end
  arr
end

print rotate_array(arr,2)
