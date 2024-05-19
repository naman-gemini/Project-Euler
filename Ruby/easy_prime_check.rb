# Easy prime check
#
# Comparision with in built prime library
# 
# require 'prime'
# Benchmark.measure do
#   (2..1_000_000).select{|t| t.prime?}.size
# end
# => <Benchmark::Tms:0x00007fc9d6834c88 @label="", @real=1.0507550000038464, @cstime=0.0, @cutime=0.0, @stime=0.0026349999999999985, @utime=1.0462299999999995, @total=1.0488649999999995>
# 
# Benchmark.measure do
#   (2..1_000_000).select{|t| prime?(t)}.size
# end
# => #<Benchmark::Tms:0x00007fc9d681cd18 @label="", @real=2.1653019999939715, @cstime=0.0, @cutime=0.0, @stime=0.004464999999999997, @utime=2.155107, @total=2.1595720000000003> 

def prime?(n)
  return true if n == 2
  return true if n == 3
  return false if n % 2 == 0
  # primes are of the form 6n - 1 or 6n + 1
  rem = n % 6
  return false if rem != 1 && rem != 5
  i = 3
  while i * i <= n
    return false if n % i == 0
    i += 2
  end
  true
end