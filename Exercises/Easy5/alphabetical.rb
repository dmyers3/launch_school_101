NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)
                  
def alphabetic_number_sort(numbers)
  numbers.sort { |x, y| NUMBER_WORDS[x] <=> NUMBER_WORDS[y] }
end

p alphabetic_number_sort((0..19).to_a)