def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |sub_array| sub_array[0] * sub_array[1] }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2])