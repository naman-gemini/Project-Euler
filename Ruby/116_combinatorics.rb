# Approach: Arrangements with repeated elements
# ways = (grey + colored)! / colored! grey!
# This is basically, ways of choosing colored tiles in total tiles in a given tile size => (grey + colored) C colored
# Which is another way of thinking about the solution
#
# Answer: 20492570929; Time: 8.6e-05 seconds
GREY = 50
$cache = {}

def fact(n)
  return 1 if n == 0 || n == 1
  return $cache[n] if $cache.key?(n)
  $cache[n] = n * fact(n - 1)
end

time = Time.now

ways = 0
(2..4).each do |size|
  # size is size of the tile. 2 for red, 3 for green, 4 for blue.
  max = GREY / size
  (1..max).each do |k|
    # k is the number of colored tiles of a kind
    ways += (fact(GREY - k * size + k) / fact(k)) / fact(GREY - k * size)
  end
end
puts ways
puts "#{Time.now - time} seconds"