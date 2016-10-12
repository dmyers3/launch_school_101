DIGITS = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def integer_to_string(int)
  string = ""
  loop do
    string << DIGITS[int % 10]
    int = int / 10
    break if int == 0
  end
  string.reverse
end

def signed_integer_to_string(int)
  if int < 0
    "-" << integer_to_string(-int)
  elsif int > 0
    "+" << integer_to_string(int)
  else
    "0"
  end
end

p signed_integer_to_string(-123)
p signed_integer_to_string(4321)
p signed_integer_to_string(0)