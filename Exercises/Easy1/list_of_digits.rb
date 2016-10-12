def digit_list(num)
  num.to_s.split("").map { |char| char.to_i }
end

p digit_list(12345)