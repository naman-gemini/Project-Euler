# Approach: Using Wilson's Theorem
# (n - 1)! ≅ - 1 mod p iff p is prime
# (n - 1)! ≅ (n - 1) mod p
# The challenge now is to find (n - 2)! and so on
# (n - 1) * (n - 2)! ≅ (n - 1) mod p
# (n - 2)! ≅ (n - 1) * (n - 1)^-1 mod p ; where (n - 1)^-1 denotes a modular inverse
# Similarly, (n - 3)! ≅ (n - 1) * (n - 1)^-1 * (n - 2)^-1 mod p

# More efficient would have been to calculate (n - 5)! mod p first and then use it to 
# calculate (n - 4)! mod p and so on. As mod inverse again and again is an expensive operation

MAX = 1_00_000_000 # 43 seconds
require_relative 'euler'

def solve(p)
  sum = res = p - 1
  (1..4).each do |k|
    res = (res * modular_inverse(p - k, p)) % p
    sum = (sum + res) % p
  end
  sum
end

sieve

sum = 0
(5..MAX).step(2).each do |p|
  next unless p.prime?
  sum += solve(p)
end
puts sum