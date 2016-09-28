# Question 1
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_age = 0
munsters.each do | name, info |
  total_age += info["age"] if info["gender"] == "male"
end

puts total_age

# Question 2
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do | name, info |
  puts "#{name} is a #{info["age"]} year old #{info["gender"]}"
end

# Question 3
def append_rutabaga(string_param, array_param)
  string_param += "rutabaga"
  array_param += ["rutabaga"]

  return string_param, array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = append_rutabaga(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 4
sentence = "Humpty Dumpty sat on a wall."
sentence = sentence.split.reverse.join(" ")
puts sentence
  
  