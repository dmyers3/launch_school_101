def reverse_words(str)
  output_string = []
  str.split.each do |word|
    if word.length >= 5
      output_string << word.reverse
    else
      output_string << word
    end
  end
  output_string.join(" ")

end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS