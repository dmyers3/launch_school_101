def multisum(int)
  (1..int).select { |num| num % 3 == 0 || num % 5 == 0}.inject(:+)
end

p multisum(3)
p multisum(5)
p multisum(10)
