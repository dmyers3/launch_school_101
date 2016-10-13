def reverse!(arr)
  arr_copy = arr.dup
  arr_size = arr.size
  arr.map! do |element| 
    arr_size -= 1
    arr_copy[arr_size]
  end
end

def reverse(arr)
  arr_copy = arr.dup
  arr_size = arr.size
  arr.map do |element| 
    arr_size -= 1
    arr_copy[arr_size]
  end
end

# list = %w(a b c d e)
# result = reverse!(list)
# p result
# p list

list2 = %w(a b c d e)
result2 = reverse(list2)
p result2
p list2
