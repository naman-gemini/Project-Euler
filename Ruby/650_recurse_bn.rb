# Approach: 
# It can be proved that: B(n) = (B(n-1) * (n)^n) / n!
# Use this recursion and memoise over it to break down B(n)
# The benefit of this is the break down can be utilised further to factorize
# When 2 numbers multiply their prime factors power add up
# When 2 numbers divide their prime factors power minus down

require 'prime'

$nth_factors = {}
$factorial_factors = {2 => [[2, 1]]}
$bn_factors = {2 => [[2, 1]]}
$modular_inverses = [0, 1]

MOD = 1000000007
MAX = 20_000

def precal_modular_inverses
  (2..MAX).each do |n|
    $modular_inverses[n] = $modular_inverses[MOD % n] * (MOD - MOD / n) % MOD  
  end
end

def merge_factors(arr_a, arr_b, type = '+')
  hash_a, hash_b = arr_a.to_h, arr_b.to_h

  if type == '+'
    merge_hash = hash_a.merge(hash_b) { |k, val_a, val_b| val_a + val_b}
  elsif type == '-'
    merge_hash = hash_a.merge(hash_b) { |k, val_a, val_b| val_a - val_b}
  end

  merge_hash.to_a
end

# n^n factors with memoization
def nth_power_factors(n)
  return $nth_factors[n] if $nth_factors.key?(n)
  $nth_factors[n] = n.prime_division.each { |arr| arr[1] = arr.last * n }
end

# n! factors with memoization
def factorial_factors(n)
  return [[n, 1]] if n == 2
  return $factorial_factors[n] if $factorial_factors.key?(n)
  $factorial_factors[n] = merge_factors(n.prime_division, factorial_factors(n - 1), '+')
end

# B(n) factors with memoization
def bn_factors(n)
  return $bn_factors[n] if $bn_factors.key?(n)
  $bn_factors[n] = merge_factors(merge_factors(bn_factors(n - 1), nth_power_factors(n), '+'), factorial_factors(n), '-')
end

def divisors_sum_from_factorization(factorization_arr)
  factorization_arr.each.inject(1) { 
    |product, arr| ((product % MOD) * ((arr.first.pow(arr.last + 1, MOD) - 1) * $modular_inverses[arr.first - 1])) % MOD
  }
end

def D(n)
  return 1 if n == 1
  puts "Solving for #{n}"
  divisors_sum_from_factorization(bn_factors(n))
end

puts "Precal Modular Inverses"
precal_modular_inverses

sum = 0
(1..MAX).each do |k|
  sum = (sum % MOD + D(k) % MOD) % MOD
end
puts sum