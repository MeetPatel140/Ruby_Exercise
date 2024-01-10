#Create a method that returns the common elements between two arrays.

arr1 = [1,2,3,4,5]
arr2 = [1,2,3]

def find_common_elements(array1,array2)
  common_elements = []
  array1.each do |element|
    if array2.include?(element)
      common_elements << element
    end
  end
  common_elements
end

puts "Common elements between two arrays are: #{find_common_elements(arr1,arr2)}"
