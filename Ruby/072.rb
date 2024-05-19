# We basically need summation of phi(n) where n <= 1 million

require 'prime'
MAX = 1_000_000

def euler_totient_function(n)
  return n - 1 if n.prime?
  prime_divisors = n.prime_division.map { |t| t.first }
  product = n
  prime_divisors.each do |divisor|
    product *= ((divisor - 1) / divisor.to_f)
  end
  product.to_i
end

ans = 0
(2..MAX).each do |num|
  ans += euler_totient_function(num)
end
puts ans
