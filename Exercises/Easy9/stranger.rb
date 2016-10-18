def greetings(name_arr, info_hash)
  name = name_arr.join(" ")
  "Hello, #{name}! Nice to have a #{info_hash[:title]} #{info_hash[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })