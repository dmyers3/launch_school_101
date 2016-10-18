# odd number
# multiple of 7
# digits occur once
# greater than given number

# could create 3 arrays for

def multiple_of_7(num)
  num % 7 == 0
end

def uniq_digits(num)
  num_as_string_array = num.to_s.chars
  num_as_string_array == num_as_string_array.uniq
end

def featured(num)
  return "There is no possible number that fulfills those requirements" if num >= 9_999_999_999
  (num+1).upto(9_999_999_999) do |x|
    return x if multiple_of_7(x) && x.odd? && uniq_digits(x)
  end
  "There is no possible number that fulfills those requirements"
end

p featured(8_876_678_233)
  
