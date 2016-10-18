# def fibonacci(int)
#   return 1 if int ==2 || int == 1
#   fibonacci(int-1) + fibonacci(int-2)
# end

def fibonacci(n)
  fib = [0, 1]
  2.upto(n) { |x| fib[x] = fib[x-1] + fib[x-2] }
  fib[n]
  
end

p fibonacci(1)
p fibonacci(2)
p fibonacci(3)
p fibonacci(4)
p fibonacci(5)
p fibonacci(100001)
