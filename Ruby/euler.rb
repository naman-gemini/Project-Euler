################## Number Theory ##################

# Greatest common divisor
def gcd(a, b)
  while b != 0
    temp = b
    b = a % b
    a = temp
  end
  return a
end

################## Combinatorics ##################

# Ruby's Arrays have a combination method which result in a (lazy) enumerator. 
# This Enumerator has a "size" method, which returns the size of the enumerator, 
# or nil if it can’t be calculated lazily. (Since Ruby 2.0)
def nCr(n, r)
  return 1 if r == 0
  return n if r == 1
  r = n - r if n - r < r
  (1..n).to_a.combination(r).size
end

alias choose nCr



################## Factorization ##################
require 'prime'

# https://mathschallenge.net/library/number/sum_of_divisors
def divisors_sum(n)
  n.prime_division.each.inject(1) { |product, arr| product * (arr.first ** (arr.last + 1) - 1) / (arr.first - 1) }
end

def divisors_count(n)
  n.prime_division.each.inject(1) { |product, arr| product * (arr.last + 1) }
end


################## Modular Arithmetic ##################

# Modular exponentiation
def modular_pow(base, exponent, mod = MOD)
  result = 1
  while exponent > 0 do
    if exponent & 1 == 1
      result = (result * base) % mod
    end
    exponent = exponent >> 1 # divide by 2
    base = (base * base) % mod
  end
  result
end

# Modular inverse of a number n with resepect to a prime number using Fermat's Little theorem
def modular_inverse(n, prime)
  n.pow(prime - 2, prime)
end

# Generate moduler inverses of numbers 1 to n using recursive relation:
# inv(a) = (inv(MOD % a) * (MOD - MOD / a)) % MOD
def precal_modular_inverses
  $modular_inverses = []
  $modular_inverses[0] = $modular_inverses[1] = 1
  (2..MAX).each do |n|
    $modular_inverses[n] = $modular_inverses[MOD % n] * (MOD - MOD / n) % MOD  
  end
end

################## Prime Numbers ##################

# Generate prime numbers upto MAX (define MAX before importing this file in your program)

# Sieve of eratosthenes
def sieve
  # Mark all true
  $prime = [true] * MAX
  # 0 and 1 are not prime
  $prime[0] = $prime[1] = false
  # Mark even numbers false
  4.step(MAX, 2) { |i| $prime[i] = false }

  3.step(MAX, 2).each do |i|
    # Break if we're past square root of MAX Value
    break if i * i > MAX
    # Start at the square of the current number, and step through.
    # Go up to the max value, by multiples of the current number, and mark them non prime
    # Only consider ones which are not already false
    (i * i).step(MAX, i) { |i| $prime[i] = false } if $prime[i] 
  end
end

# Generates list of primes in $primes array
# Needs sieve to be called first
def generate_primes
  $primes = []
  $prime.each_with_index { |flag, i| $primes << i if flag }
end

class Integer
  def prime?
    $prime[self]
  end
end