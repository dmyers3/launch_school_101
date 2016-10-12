def average(arr)
  array_sum = 0
  arr.each do |int|
    array_sum += int
  end
  (array_sum / arr.size).to_f
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])