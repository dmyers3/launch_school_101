print "Please write word or multiple words: "
input = gets.chomp

chars = input.delete(" ").length

puts "There are #{chars} characters in #{input}."