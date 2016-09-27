# Question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.keys.include?("Spot")
p ages.key?("Spot")
p ages.has_key?("Spot")

# Question 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
sum = 0
ages.each_value do | value |
  sum += value
end
p sum

# Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.reject! do |key, value|
  value >= 100
end
p ages

# Question 4
munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.capitalize
puts munsters_description.swapcase
puts munsters_description.downcase
puts munsters_description.upcase

# Question 5
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
p ages

# Question 6
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.min

# Question 7
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.include?("dino")

# Question 8
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
puts flintstones.find_index { |name| name.slice(0,2) == 'Be' }

# Question 9
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! do |name| 
  name.slice(0,3)
end
p flintstones

# Question 10
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name.slice(0,3) }
p flintstones