def sum(int)
  total = 0
  int.to_s.split("").each do |element|
    total += element.to_i
  end
  total
end

puts sum(123_456_789)