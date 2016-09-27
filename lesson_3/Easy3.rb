# Question 1
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# Question 2
flintstones.push('Dino')
p flintstones

# Question 3
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push('Dino').push('Hoppy')
p flintstones

# Question 4
advice = "Few things in life are as important as house training your pet dinosaur."
# example solution: advice.slice!(0, advice.index('house'))
advice.slice!("Few things in life are as important as ")
puts advice

# Question 5
statement = "The Flintstones Rock!"
puts statement.count('t')

# Question 6
title = "Flintstone Family Members"
puts title.center(40)