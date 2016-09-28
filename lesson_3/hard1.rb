# Question 3
# A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #one
puts "two is: #{two}" #two
puts "three is: #{three}" #three

mess_with_vars(one, two, three)

#B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #one
puts "two is: #{two}" #two
puts "three is: #{three}" #three

mess_with_vars(one, two, three)

#C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #two
puts "two is: #{two}" #three
puts "three is: #{three}" #one

mess_with_vars(one, two, three)

# Question 4

def generate_uuid
  hexa = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  uuid = Array.new(32)
  uuid.each_index do |n|
    uuid[n] = hexa.sample
  end
  uuid.join.insert(20, '-').insert(16, '-').insert(12, '-').insert(8, '-')
end

puts generate_uuid

# Question 5

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  case dot_separated_words.size
    when (0..3), (5..(1.0/0.0))
      return false
    else
      while dot_separated_words.size > 0 do
        word = dot_separated_words.pop
        return false if !is_an_ip_number?(word)
      end
  end
  true
end

