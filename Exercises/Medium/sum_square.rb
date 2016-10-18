def sum_square_difference(int)
  square_of_sums(int) - sum_of_squares(int)
end


def square_of_sums(int)
  sum = 1.upto(int).reduce(:+)
  sum * sum
end

def sum_of_squares(int)
  1.upto(int).map { |x| x * x }.reduce(:+)
end

p sum_square_difference(10)