def cleanup(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end