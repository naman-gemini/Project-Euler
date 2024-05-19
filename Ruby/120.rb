# Approach: Simple Algebra and Logic
# (a + 1)^n = a^n + nC1 a^n-1 + nC2 a^n-2 + .... nCk a^n-k + ... + 1
# (a - 1)^n = a^n - nC1 a^n-1 + nC2 a^n-2 - .... nCk a^n-k + ... + (-1)^n
#
# Adding both
# (a + 1)^n + (a - 1)^n = 2 * (a^n + nC2 a^n-2 + .... nC2k a^n-2k + ....) ; where k: 0 -> n/2
# Now, almost all of the terms here would be divisible by a^2 and hence give 0 remainder; apart from the 2nd last term
# Generalising, for the kth term to be divisible by a^2:
# n - 2k >= 2 => k <= (n - 2) / 2 => k <= n / 2 - 1
# Hence, k > n / 2 - 1 for the expression to leave a remainder
# As, the max value of k is n / 2, that is the only value that qualifies
# The max value of k = n / 2 is actually integer division, hence floor (n / 2)
# So, if n is even => only k value to consider (for remainder) is n / 2
# if n is odd => only k value to consider (for remainder) is (n - 1) / 2
#
# If n is even, the expression (that will give remainder) would be: 2 * (nCn a^0) % a^2 = 2 * 1 * 2 % a^2 = 2 ; k = n / 2
# If n is odd, the expression (that will give remainder) would be: 2 * (nCn-1 a^n-n+1) % a^2 = 2 * n * a % a^2; k = (n - 1) / 2
#
# Now the challenge is to find max value of remainder. We can iterate over `x` values of n and hope we have the answer, or we can solve it further
# For even, remainder is constant => 2. For odd, it's 2an.
# 2an % a^2 is same as 2n % a, so this is what we have to maximise
# We know the this remainder goes from 0 to a - 1. For max value, 2n should be a - 1 (for a - 1 remainder)
# 2n' = a - 1 => n' = (a - 1) / 2; where n' is the value of n which gives the max remainder
# As n' should be an integer => n' = floor((a - 1) / 2)
# Max Remainder: 2 * a * n' = 2 * a * floor((a - 1) / 2)
#
# Answer: 333082500; Time: 0.0001 seconds

time = Time.now

puts (3..1000).inject(0) { |sum, a| sum + 2 * a * ((a - 1) / 2) }

puts "#{Time.now - time} seconds"