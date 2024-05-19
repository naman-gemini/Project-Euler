# The equation to solve is: 2 b^2 - 2 b - n^2 - n = 0 ; where b is blue discs; n is total discs
# Only constraint: n > 10**12
#
# After wasting a lot of time trying to solve this as a simple quadratic equation
# I realised that this is a classic Diophantine Equation (as we want integral solutions only)
# Didn't want to understand them in depth, much like previous related problems
# There's an online solver: https://www.alpertron.com.ar/QUAD.HTM
#
# Recursive solutions ( b -> x; n -> y):
# x(n+1) = 3 ⁢x(n) + 2 ⁢y(n) - 2 ; x(0) = 1
# y(n+1) = 4 ⁢x(n) + 3 ⁢y(n) - 3 ; x(0) = 1
#
# Answer: 756872327473; Time: 1.5e-05 seconds

time = Time.now

MAX = 10**12
b = 1
n = 1
until n > MAX
  b, n = 3 * b + 2 * n - 2, 4 * b + 3 * n - 3 # Don't want to use temp variable :D
end
puts b
puts "Time: #{Time.now - time} seconds"

