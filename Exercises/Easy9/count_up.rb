def sequence(int)
  count_up_array = []
  int.times { |idx| count_up_array[idx] = idx + 1 }
  count_up_array
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]