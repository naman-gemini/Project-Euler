# Approach: Simple brute force, with some logical break conditions
# Answer: 1097343; Time: 15.449611 seconds

MAX = 50 * 10**6
require_relative 'euler'

t1 = Time.now

sieve
$prime_numbers = []
$primes.each_with_index { |flag, i| $prime_numbers << i if flag && i * i <= MAX } # Max prime number needed is sqrt(MAX)

numbers = []
$prime_numbers.each do |p1|
  val1 = p1 * p1 * p1 * p1
  break if val1 >= MAX
  $prime_numbers.each do |p2|
    val2 = p2 * p2 * p2
    break if val1 + val2 >= MAX
    $prime_numbers.each do |p3|
      val3 = p3 * p3
      break if val1 + val2 + val3 >= MAX
      numbers << val1 + val2 + val3
    end
  end
end
puts numbers.uniq.count

puts "Time: #{Time.now - t1} seconds"