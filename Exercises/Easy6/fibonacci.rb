def find_fibonacci_index_by_length(digits)
  return 1 if digits == 1
  fibonacci = [1, 1]
  fib_idx = 2
  loop do
    fibonacci[fib_idx] = fibonacci[fib_idx - 1] + fibonacci[fib_idx - 2]
    break if fibonacci[fib_idx].to_s.length >= digits
    fib_idx += 1
  end
  fib_idx + 1
end


p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
p find_fibonacci_index_by_length(1)