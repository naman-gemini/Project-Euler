# Using the steps (Show Steps) mentioned here: https://www.alpertron.com.ar/QUAD.HTM
# to solve a generic 2 variable quadratic equation => ax^2 + bxy + cy^2 + dx + ey + f = 0
# Brute forcing over values of n
# Answer: 180180; Time: 255.030678 seconds

D = 1
MAX = 1000
require_relative 'euler'

def solutions(n)
  (divisors_count(n) / 2.0).ceil # distinct solutions
end

time = Time.now

n = 1
loop do
  a, b, c, d, e, f = 0, -1, 0, n, n, 0

  alpha = 2 * c * d - b * e
  beta = 2 * a * e - b * d
  xy = alpha * beta
  ans = solutions(xy)
  puts "n = #{n}, ans = #{ans}"
  if ans > MAX
    puts n
    break
  end
  n += 1
end
puts "Time: #{Time.now - time} seconds"
