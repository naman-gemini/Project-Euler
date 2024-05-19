# Brute Force approach clearly doesn't work as done in 650_brute_force.rb It takes 12 seconds to calculate till 500
# New approach: It can be deduced B(n) = B(n-1) * n^n / n!
#
# The thing is B(500) has 53629 digits. This huge number would take time to prime factorize. And we have to go till B(20000)
# So clearly some mathematical complexity reduction is required.
# We need to find some way to factorize easily or recursively

require 'prime'

$factorials = {}
$bn_array = {}

MOD = 1000000007
MAX = 100

def divisors_sum(n)
  n.prime_division.each.inject(1) { 
    |product, arr| ((product % MOD) * ((arr.first ** (arr.last + 1) - 1) / (arr.first - 1) % MOD)) % MOD
  }
end

def factorial(num)
  return 1 if num == 1
  return $factorials[num] if !$factorials[num].nil?
  $factorials[num] = num * factorial(num - 1)
end

def B(n)
  return 1 if n == 1
  return $bn_array[n] if !$bn_array[n].nil?
  $bn_array[n] = B(n - 1) * (n ** n) / factorial(n)
end

def D(n)
  divisors_sum(B(n))
end

sum = 0
(1..MAX).each do |k|
  sum = (sum % MOD + D(k) % MOD) % MOD
end
puts sum