require 'prime'
require_relative 'lib/algorithms'

LIMIT = 500500
MAX = 10**7 # 500500th prime number is 7_376_507 (pre-calculated)
MOD = 500500507

primes = Prime.each(MAX).to_a.first(LIMIT)
next_prime_index = 0
heap = Containers::MinHeap.new([primes[next_prime_index]])

# We start with 1 (1 as the factor as well) and then start adding
# prime factors in a manner that it doubles the number of divisors in every turn
# So after 500500 iterations, we'll get 2^500500 divisors
# At the same time, we minimise the number (product of prime factors, with exponents)
ans = 1
# At every step we have to double the number of factors
# We have 2 options
# a) Add new prime number
# b) Increase exponent of previous prime number (minimum of the lot) by exponent + 1 => Push square of current value in heap
# Compare above 2, pick the minimum choice
LIMIT.times do |x|
  min = heap.pop # pick the minimum option that we have
  heap.push(min * min)
  if min == primes[next_prime_index] # if we have picked a new prime instead of increasing exponent, then put next new prime in heap
    next_prime_index += 1
    heap.push(primes[next_prime_index])
  end
  ans = (ans * min) % MOD
end

puts ans

# NOTE: Very nice explanation: https://github.com/nayuki/Project-Euler-solutions/blob/master/python/p500.py?ts=2