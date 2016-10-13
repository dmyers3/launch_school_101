MINUTES_IN_DEGREE = 60
SECONDS_IN_MINUTE = 60

def dms(angle)
  "%(#{angle.to_i}°#{(angle % 1 * MINUTES_IN_DEGREE).to_i}')"
end

puts dms(76.73)
  