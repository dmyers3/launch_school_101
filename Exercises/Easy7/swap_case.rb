def swapcase(str)
  characters = str.chars.map do |char|
    if char =~ /[A-Z]/
      char.downcase
    elsif char =~ /[a-z]/
      char.upcase
    else
      char
    end
  end
  characters.join
end

puts swapcase('Tonight on XYZ-TV')