def show_multiplicative_average(arr)
  '%.3f' % (arr.inject(:*) / arr.size.to_f)
end

p show_multiplicative_average([3,5])