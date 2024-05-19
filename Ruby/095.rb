# Brute Force
# Answer: 14316; Time: 1.580961 seconds

MAX = 10**6
require_relative 'euler'

time = Time.now

$cache = {}

def proper_divisors_sum(n)
  return $cache[n] if $cache.key?(n)
  $cache[n] = divisors_sum(n) - n
end

max_chain = 0
min_member = 0

(2..1_00_000).each do |n|
  start = n
  chain = [n]
  n = proper_divisors_sum(n)
  until start == n || n == 0
    break if n > MAX || chain.include?(n)
    chain << n
    n = proper_divisors_sum(n)
  end
  # puts chain.join(', ') if n == start
  if n == start && chain.size > max_chain
    max_chain = chain.size
    min_member = chain.min
  end
end

# puts "*"*50
puts min_member
puts "Time: #{Time.now - time} seconds"