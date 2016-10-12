def string_to_integer(str)
  num_array = str.chars.map do |char|
    case char
    when '-' then 0
    when '+' then 0
    when '0' then 0
    when '1' then 1
    when '2' then 2
    when '3' then 3
    when '4' then 4
    when '5' then 5
    when '6' then 6
    when '7' then 7
    when '8' then 8
    when '9' then 9
    end
  end
  final_number = 0
  num_array.each { |digit| final_number = 10 * final_number + digit }
  final_number
end

def string_to_signed_integer(str)
  if str[0] == '-'
    string_to_integer(str) * -1
  else
    string_to_integer(str)
  end
end

p string_to_signed_integer('-4321')