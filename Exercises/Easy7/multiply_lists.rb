def multiply_lists(arr1, arr2)
  multiplied_array = []
  arr1.each_with_index { |num, idx| multiplied_array[idx] = num * arr2[idx] }
  multiplied_array
end

p multiply_lists([3, 5, 7], [9, 10, 11])