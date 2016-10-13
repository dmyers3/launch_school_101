def staggered_case(str)
  staggered_array = []
  str.chars.each_with_index do |char, idx|
    if idx.even?
      staggered_array[idx] = char.upcase
    else
      staggered_array[idx] = char.downcase
    end
  end
  staggered_array.join
end

puts staggered_case('I Love Launch School!')
puts staggered_case('ignore 77 the 444 numbers')