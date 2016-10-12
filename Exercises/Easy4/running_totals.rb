def running_total(arr)
  sum = 0
  arr.map do |num|
    sum += num
  end
end

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20])
p running_total([3])
p running_total([])