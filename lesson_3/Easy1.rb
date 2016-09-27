# Question 3
advice = "Few things in life are as important as house training your pet dinosaur"
advice.gsub!('important', 'urgent')
puts advice

# Question 5
puts (10..100).include?(42)

# Question 6
famous_words = "seven years ago..."
famous_words.insert(0, 'Four score and ')
puts famous_words

famous_words = "seven years ago..."
famous_words = "Four score and ".concat(famous_words)
puts famous_words

# Question 7
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

p eval(how_deep)

# Question 8
flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
flintstones.flatten!
p flintstones

# Question 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
barney = flintstones.to_a[2]
p barney

# Question 10
flintstones_hash = Hash.new
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones.each_with_index do | value, index |
  flintstones_hash[value] = index
end
p flintstones_hash