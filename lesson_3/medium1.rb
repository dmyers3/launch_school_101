# Question 1
10.times { |n| puts " " * n + "The Flintstones Rock!" }

# Question 2
statement = "The Flintstones Rock"
statement_uniq = statement.split(//).uniq
statement_uniq.delete(" ")
statement_hash = {}

statement_uniq.each do |letter|
  statement_hash[letter] = statement.count(letter)
end

p statement_uniq
p statement_hash

# Question 3
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

# Question 5
def factors(number)
  dividend = 1
  divisors = []
  while dividend <= number
    divisors << number / dividend if number % dividend == 0
    dividend += 1
  end
  divisors
end

p factors(12)
p factors(0)

# Question 7


def fib(first_num, second_num)
  limit = 15
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# Question 8
def titleize(string)
  string_array = string.split
  string_array.each {|word| word.capitalize! }
  string_array.join(" ")
end

puts titleize("The quick brown fox jumps over the lazy dog")
    
# Question 9
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do | name, info |
  case munsters[name]["age"]
    when (65..(1.0/0.0))
      munsters[name]["age_group"] = "senior"
    when (18..64)
      munsters[name]["age_group"] = "adult"
    when (0..17)
      munsters[name]["age_group"] = "kid"
  end
    
end

p munsters
