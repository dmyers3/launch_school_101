
def oddities(arr)
  return_array = []
  arr.each_index { |idx| return_array << arr[idx] if idx.even? }
  return_array
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []