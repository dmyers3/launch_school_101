def stringy(int, start = 1)
  output = []
  int.times do |time| 
    output << (time % 2 == 0 ? '1' : '0')
  end
  output.join
end

puts stringy(6)