def buy_fruit(groc_list)
  fruit_list = []
  groc_list.each { |fruit, quantity| quantity.times { fruit_list << fruit} }
  fruit_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])