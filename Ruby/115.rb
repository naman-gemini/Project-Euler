# Bottom up dp (Same as problem 114)
# Recursion:
# If T(n) are number of ways to solve n grey tiles with atleast MIN sized red tiles
# You can start laying `size` sized red tiles from position `pos` (1th indexed array)
# You can solve the rest of the problem in T(n - size - pos) ways
# T(n) = T(n - size - pos); pos: 0 -> n - min_size + 1 = n - 3 + 1 = n - 2; size: min_size -> n - pos + 1
#
# Answer: 168; Time: 0.024661 seconds
MAX = 10**6
MIN = 50

time = Time.now

dp = [1] * MIN # T(0) = T(1) = T(2) ... T(MIN - 1) = 1 => All tiles grey => 1 way
n = MIN
loop do
  ways = 0
  1.upto(n - MIN + 1).each do |pos|
    MIN.upto(n - pos + 1).each do |size|
      ways += n - size - pos > MIN - 1 ? dp[n - size - pos] : 1
    end
  end
  if ways + 1 > MAX
    puts n
    break
  end
  dp[n] = ways + 1 # Case where all cells are empty
  n += 1
end
puts "#{Time.now - time} seconds"
