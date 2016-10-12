def century(year)
  cent = (year/100.0).ceil
  last_digit = cent % 10
  case last_digit
  when 1 
    return cent.to_s + century_suffix(cent)
  when 2
    return cent.to_s + century_suffix(cent)
  when 3
    return cent.to_s + century_suffix(cent)
  else
    return cent.to_s + century_suffix(cent)
  end
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include? century % 100
  last_digit = century % 10
  case last_digit
  when 1 
    return 'st'
  when 2
    return 'nd'
  when 3
    return 'rd'
  else
    return 'th'
  end
end
  

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'