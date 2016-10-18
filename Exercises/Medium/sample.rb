def is_prime?(int)
  2.upto(int - 1) { |x| return false if int % x == 0 }
  true
end

p is_prime?(3)
p is_prime?(4)