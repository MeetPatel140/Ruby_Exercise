#Implement a method to calculate the sum of all elements in an array.
arr = [1,2,3,4,5]

def sum_array(arr)
  sum = 0
  for num in 0...arr.length
    sum += arr[num]
  end
  print "Sum of Array is: #{sum}"
end

puts sum_array(arr)
