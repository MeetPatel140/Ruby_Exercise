#Write a function to find the maximum element in an array.

arr = [10, 20, 30, 40, 50]

def array_max(arr)
  max = arr[0]
  for value in arr
    if value > max
      max = value
    end
  end
  max
end

puts array_max(arr)
