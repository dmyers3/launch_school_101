def word_sizes(str)
  counter_hash = Hash.new(0)
  length_array = str.split(" ").map { |word| word.length }.each do |number|
    counter_hash[number] += 1
  end
  counter_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

