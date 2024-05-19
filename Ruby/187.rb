# Brute force
# Answer: 17427258; Time: 16.159546 seconds

LIMIT = 10**8
MAX = LIMIT / 2

require_relative 'euler'

time = Time.now

sieve
generate_primes

count = 0
0.upto($primes.size - 1).each do |i|
  break if $primes[i] * $primes[i] > LIMIT
  i.upto($primes.size - 1).each do |j|
    break if $primes[i] * $primes[j] > LIMIT
    count += 1
  end
end
puts count
puts "Time: #{Time.now - time} seconds"


# NOTE: This can also be used for faster results -> https://en.wikipedia.org/wiki/Prime-counting_function