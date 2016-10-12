def reverse_sentence(str)
  reversed_string = ""
  str_to_array = str.split
  str_to_array.each do |word|
    reversed_string.prepend("#{word} ")
  end
  puts reversed_string
end

reverse_sentence("Reverse these words")