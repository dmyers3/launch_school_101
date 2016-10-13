def word_cap(str)
  str.split.map { |word| word.capitalize }.join(" ")
end

puts word_cap('four score and seven')
puts word_cap('the javaScript language')
puts word_cap('This is a "quoted" word')