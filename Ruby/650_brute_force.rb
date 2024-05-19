require_relative 'euler'
require 'prime'

MOD = 1000000007
MAX = 100

def divisors_sum(n)
  n.prime_division.each.inject(1) { 
    |product, arr| ((product % MOD) * ((arr.first ** (arr.last + 1) - 1) / (arr.first - 1) % MOD)) % MOD
  }
end

def B(n)
  (0..n).inject(1) { |product, r| product * choose(n, r) }
end

def D(n)
  puts "Solving for #{n}"
  divisors_sum(B(n))
end

sum = 0
(1..MAX).each do |k|
  sum = (sum % MOD + D(k) % MOD) % MOD
end
puts sum