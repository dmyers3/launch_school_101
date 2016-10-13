def triangle(n)
  n.times { |count| puts "#{' ' * ((n-1) - count)}" + "#{'*' * (1 + count)}" }
end

# 1) 8 spaces 1 asterisk
  # 2) 7 / 2
  # 3) 6 / 3
  # 4) 5 / 4
  
triangle(5)