def xor?(boolean1, boolean2)
  (boolean1 || boolean2) && !(boolean1 && boolean2)
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?) 
puts xor?(5.even?, 4.odd?) 