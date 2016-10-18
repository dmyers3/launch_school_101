def substrings_at_start(str)
  substrings = []
  str.length.times { |idx| substrings[idx] = str.slice(0,idx+1) }
  substrings
end

p substrings_at_start('xyzzy')