#Implement a function that checks if two arrays are equal (contain the same elements in the same order).

arr1 = [1, 2, 3, 4, 5]
arr2 = [1, 2, 3, 4, 5]

def check_array(array1, array2)
  false if array1.length != array2.length

  for i in 0...array1.length
    if array1[i] != array2[i]
      false
    end
  end
  true
end

if check_array(arr1, arr2)
  puts "Both Arrays are Equal"
else
  puts "Both Arrays are not Equal"
end
