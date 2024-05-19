# Bottom up dp
# Recursion:
# If T(n) are number of ways to solve n grey tiles with atleast 3 sized red tiles
# You can start laying `size` sized red tiles from position `pos` (1th indexed array)
# You can solve the rest of the problem in T(n - size - pos) ways
# T(n) = T(n - size - pos); pos: 0 -> n - min_size + 1 = n - 3 + 1 = n - 2; size: 3 -> n - pos + 1
#
# Answer: 16475640049; Time: 0.003563 seconds
GREY = 50

time = Time.now

dp = [1] * 3 # T(0) = T(1) = T(2) = 1 => All tiles grey => 1 way
(1..GREY).each do |n|
  ways = 0
  1.upto(n - 2).each do |pos|
    3.upto(n - pos + 1).each do |size|
      ways += n - size - pos > 2 ? dp[n - size - pos] : 1
      # puts "n = #{n}, pos = #{pos}, size = #{size}, ways = #{ways}"
    end
  end
  dp[n] = ways + 1 # Case where all cells are empty
end
puts dp[GREY]
puts "#{Time.now - time} seconds"

# A very good approach is here (more intuitive):
# https://github.com/nayuki/Project-Euler-solutions/blob/master/python/p114.py
# I was doing the same, but somehow mistyped a sign and messed it.
