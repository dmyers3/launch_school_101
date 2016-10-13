def interleave(arr1, arr2)
  combined_arr = []
  arr1.each_index { |idx| combined_arr << arr1[idx] << arr2[idx] }
  combined_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c'])