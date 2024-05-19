MAX = 10_000
require_relative 'euler'

sieve

def fact_mod(n, mod)
  (1..n).inject(1) { |product, n| (product * n) % mod }
end

sum = 0
(5..MAX).step(2).each do |p|
  next unless p.prime?
  # puts "Solving for p = #{p}"
  sum += (1..5).inject(0) { |sum, k| (sum + fact_mod(p - k, p)) % p }
end
puts sum