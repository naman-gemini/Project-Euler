# Using formula of φ(n) from https://en.wikipedia.org/wiki/Euler%27s_totient_function

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

max = ans = 0
(2..MAX).each do |n|
  ratio = n.to_f / euler_totient_function(n)
  if ratio >= max
    ans = n
    max = ratio
    # puts "n = #{n}, ratio = #{ratio}"
  end
end

puts ans