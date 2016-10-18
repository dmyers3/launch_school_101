def sum_of_sums(arr)
  sum = 0
  arr.each_with_index { |num, idx| sum += num * (arr.size - idx) }
  sum
end

puts sum_of_sums([3, 5, 2])
puts sum_of_sums([1, 5, 7, 3])

# 3 index 0 - added 3 times (arr size)
# 5 index 1 - added 2 times (arr size - 1)
# 2 index 2 - added 1 time  (arr_size - 2)