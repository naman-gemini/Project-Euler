require 'set'
require 'prime'
MAX = 10000
primes = (2..MAX).select { |n| n.prime? }.to_set
composites = (2..MAX).reject { |n| n.prime? }.to_set
twicesquares = (0..Math.sqrt(MAX)).map { |n| 2 * (n**2) }.to_set
sums = primes.to_a.product(twicesquares.to_a).map { |a, b| a + b }.to_set
puts composites.select { |n| !sums.include?(n) && n.odd? }.min