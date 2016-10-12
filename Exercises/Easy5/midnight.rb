def time_of_day(mins)
  if mins >= 0
    minutes = mins % 60
    hours = mins / 60 % 24
    "#{"%02d" % hours}:#{"%02d" % minutes}"
  else
    minutes = 60 - (-mins % 60)
    hours = 23 - (-mins / 60 % 24)
    "#{"%02d" % hours}:#{"%02d" % minutes}"
  end
end

puts time_of_day(-3)
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"


def after_midnight(time)
  time_array = time.split(":")
  time_array[0].to_i * 60 + time_array[1].to_i
end

def before_midnight(time)
  1440 - after_midnight(time)
end

puts after_midnight('24:00')
puts before_midnight('24:00')