# Brute Force
# Answer: 21417; Time: 1.585784 seconds

require 'prime'

$rads = {}

MAX = 10**5
VAL = 10**4

time = Time.now

(2..MAX).each do |n|
  if n.prime?
    $rads[n] = n
  else
    $rads[n] = n.prime_division.inject(1) { |product, (p, e)| product * p }
  end
end

sorted = $rads.sort_by { |k, v| [v, k] } # 0 indexed
# puts sorted[4 - 2].first
# puts sorted[6 - 2].first
puts sorted[VAL - 2].first

puts "Time: #{Time.now - time} seconds"