def remove_vowels(arr_of_str)
  arr_of_str.map { |str| str.delete('aeiouAEIOU')}
end

p remove_vowels(%w(green YELLOW black white))