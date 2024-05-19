# Approach: Brute Force
# Looping over the number of hole tiles, we find paremeter in each case
# All cumulative sums of perimeters can result in the hole we're calculating
# We could have used formula also instead of looping and adding, as the perimeter series is in GP
# But as max is a million only, we can just loop over it
#
# Answer: 1572729; Time: 0.246886 seconds
LIMIT = 10 ** 6

time = Time.now
total_sum = 0

hole = 1
while 4 * (hole + 1) <= LIMIT
  side = hole + 1
  cumulative_sum = 0
  loop do
    perimeter = side * 4
    cumulative_sum += perimeter
    break if cumulative_sum > LIMIT
    total_sum += 1
    side += 2
  end
  hole += 1
end

puts total_sum
puts "#{Time.now - time} seconds"