# Using same approach as Problem 120: Remainder is 2 * a * n; where a in primes, n is odd. Remainder is 2 for n is even
# Keep incrementing MAX until we find the answer
# Answer: 21035; Time: 0.29339 seconds

MAX = 10**6
LIMIT = 10**10
require_relative 'euler'

time = Time.now

sieve
generate_primes

$primes.each_with_index do |p, i|
  next if i % 2 == 1 # n is basically i + 1, even n or odd i will give 2 as remainder
  remainder = 2 * p * (i + 1) # if i + 1 is odd
  if remainder > LIMIT
    puts i + 1
    break
  end
end

puts "#{Time.now - time} seconds"

