def rotate_array(arr)
  arr.slice(1,arr.length-1) + [arr[0]]
end

# p rotate_array([7, 3, 5, 2, 9, 1])

# def rotate_rightmost_digits(num, digits)
#   return num if digits == 0
#   num_as_string_array = num.to_s.chars
#   sub_array_to_rotate = num_as_string_array[-digits..-1]
#   left_array = num_as_string_array - sub_array_to_rotate
#   right_array = rotate_array(sub_array_to_rotate)
#   rotated_number = (left_array + right_array).join.to_i
# end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915  
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917
# p rotate_rightmost_digits(735291, 0)

def max_rotation(int)
  int_digits =  int.to_s.length
  rotation_iterations = int_digits - 1
  rotated_number = int
  rotation_iterations.times { |iteration| rotated_number = rotate_rightmost_digits(rotated_number, int_digits - iteration) }
  rotated_number
end

p max_rotation(735291)
p max_rotation(8_703_529_146)

# n - 1 rotations
# 1st rotation uses right_most (6) for iteration = 0
# 2nd rotation uses right_most (5)               = 1
# 3rd rotation uses right_most (4)               = 2
# digits - iteration
