BLOCKS =  { B: 'O' ,  X:'K'  , D:'Q' ,  C:'P'  , N:'A',
G:'T' ,  R:'E'  , F:'S' ,  J:'W'  , H:'U',
V:'I' ,  L:'Y'  , Z:'M' }

def block_word?(word)
  word_array = word.chars
  word_array.each { |char| return false if word.include?(BLOCKS[char.to_sym]) }
  true
end

p block_word?('BATCH')