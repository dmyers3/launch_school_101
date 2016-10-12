def ascii_value(str)
 sum = 0
 str.chars.each { |char| sum += char.ord }
 sum
end

p ascii_value("Hello World")
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0