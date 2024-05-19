# Doing some online research, found out shortest surface distance in a cuboid is sqrt( l^2 + (b + h)^2 ); l >= b >= h
# So basically we need integral solutions to l^2 + (b + h)^2 which are squares, which means essentially finding pythagorean triplets
# Brute force doesn't work as it would follow n^3 complexity and n^4 if we loop over value of M.
# So, generating pythagorean triplets seems a reasonable way forward.
# x^2 + y^2 = z^2; x = l, y = b + h
# As, l is the biggest amongst l, b, h that is what will decide value of M
#
# Using Euclid's formula to generate pythogorean triplets (https://en.wikipedia.org/wiki/Pythagorean_triple)
#
# Answer: 1818; Time: 0.97468 seconds
require_relative 'euler'

LIMIT = 1_000_000
MAX = 2000 # This is the MAX value of M, we increment this value gradually => Ideal way: Binary Search for this

time = Time.now

solutions = Hash.new(0)

# m > n > 0
1.upto(MAX - 1).each do |n|
  (n + 1).upto(MAX).each do |m|
    next unless gcd(m, n) == 1 && (m - n) % 2 == 1
    k = 1
    loop do
      x = k * (m * m - n * n)
      y = k * 2 * m * n
      break if x > MAX and y > MAX
      x, y = y, x if y > x # swap if y is greater

      # There can be 2 cases here (assuming x > y). We will calculate solutions for l, b, h separately for both cases
      # Again, as l is supposed to be largest amongst the 3. We keep solutions arrray indexed on value of l
      # 1) l = x and b + h = y -> Number of b x h combinations = y / 2
      solutions[x] += y / 2
      # 2) b + h = x and l = y -> Number of b x h combinations would be less than x / 2 here, because b + h can be greater than l, but l needs to be greater than b >= h
      # Hence, we would need to count these solutions
      # 1.upto(x - 1).each do |h|
      #   break if h > y
      #   h.upto(x).each do |b|
      #     break if b > y
      #     solutions[y] += 1 if b + h == x
      #   end
      # end
      # This loop would be expensive, we can actually formulate a formulae, just like above case
      # l >= b >= h => l >= b >= (b + h) / 2 as  b >= h
      # Now, that we have expressed range of b in terms of l => y and b + h => x
      # We can say valid solutions are all integers from x / 2 to y => y - x/2
      # NOTE: All of above might not make valid solutions as explained below
      solutions[y] +=  (y - (x - 1) / 2) > 0 ? y - (x - 1) / 2 : 0 # x - 1 because b = h is valid solution
      # There's a ternary operator becaue if: y - (x - 1) / 2 < 0 => 2 y - x + 1 < 0 => 2 y < x - 1 => 2 * l < b + h
      # That means one of b or h is greater than l, hence reject those solutions 
      k += 1
    end
  end
end

cumulative_sum = 0
solutions.sort.each do |k, v|
  # puts cumulative_sum
  cumulative_sum += v
  if cumulative_sum > LIMIT
    puts k
    break
  end
end
puts "#{Time.now - time} seconds"