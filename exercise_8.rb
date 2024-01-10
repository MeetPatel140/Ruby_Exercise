#Create a function that returns the unique elements from an array.

arr = [1,2,3,2,1]
$unique = []
found = false

def find_unique(arr)
  for i in 0...arr.length
    found = false
    for j in 0...$unique.length
      if arr[i] == $unique[j]
        found = true
        break
      end
    end
    $unique.push(arr[i]) unless found
  end
  return $unique
end

puts find_unique(arr)
