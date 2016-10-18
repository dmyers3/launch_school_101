light_array = Array.new(1000,-1)

1000.times do |iteration|
  light_array.each_index do |idx| 
    light_array[idx] = (-1 * light_array[idx]) if (idx + 1) % (iteration + 1) == 0
  end
end

lights_on = light_array.select { |element| element == 1 }
lights_off = light_array.select { |element| element == -1 }

puts "There are #{lights_on.size} lights on and #{lights_off.size} lights off."
  
  
  
# 1st time through flip 1,2,3,4....
# 2nd time              2,4,6,8....
# 3rd time              3,6,9,12....
# 4th time              4,8,12,16