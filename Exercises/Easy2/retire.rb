print "What is your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
retire_age = gets.chomp.to_i

work_years_left = retire_age - age

puts "It's #{Time.now.year}. You will retire in #{Time.now.year + work_years_left}."
puts "You only have #{work_years_left} years of work to go!"