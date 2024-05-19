# Using the same approach as in 116_dp.rb
# T(n) = T(n - 1) + summation(1 + T(n - m))
# Solution of n sized grid = T(n) + 1 (1 for all empty)
#
# Answer: 100808458960497; Time: 3.1e-05 seconds
GREY = 50

time = Time.now

dp = [0]
(1..GREY).each do |n|
  dp[n] = dp[n - 1]
  (2..4).each do |m|
    dp[n] += 1 + dp[n - m] if n - m >= 0
  end
end
puts dp[GREY] + 1
puts "#{Time.now - time} seconds"