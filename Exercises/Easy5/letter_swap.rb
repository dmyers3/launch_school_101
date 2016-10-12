def swap(str)
  swap_array = str.split(' ').map! do |word|
    first_letter = word[0]
    word[0] = word[-1]
    word[-1] = first_letter
    word
  end
  swap_array.join(" ")
end

p swap("Hello World")
p swap('Oh what a wonderful day it is')
p swap('Abcde')
p swap('a')