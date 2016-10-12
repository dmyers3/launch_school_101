vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle',
            'motorcycle', 'car', 'truck']

def count_occurences(vehicles)
  uniq_vehicles = vehicles.uniq
  uniq_vehicles.each { |vehicle| puts "#{vehicle} => #{vehicles.count(vehicle)}" }
end

count_occurences(vehicles)
