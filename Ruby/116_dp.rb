# The nature of the problem clearly indicates we can handle this by solving recursively
# Let's say for a n grey tiled grid number of ways = T(n)
# At every tile (moving left to right) we have 2 options:
# a) We keep the tile empty and solve rest of the problem in T(n - 1) ways
# b) Put the m sized tile (1 way) and solve rest of the problem in T(n - m) ways
# Hence, T(n) = T(n - 1) + 1 + T(n - m); T(0) = 0.
# For this problem m goes from 2 to 4
#
# Solving in a bottom up dp fashion. T(50) should have the answer.
#
# Answer: 20492570929; Time: 2.7e-05 seconds
GREY = 50

time = Time.now

dp = []
total_ways = 0
(2..4).each do |m|
  dp[0] = 0
  (1..GREY).each do |n|
    dp[n] = dp[n - 1] + (n - m >= 0 ? 1 + dp[n - m] : 0)
  end
  total_ways += dp[GREY]
end
puts total_ways
puts "#{Time.now - time} seconds"