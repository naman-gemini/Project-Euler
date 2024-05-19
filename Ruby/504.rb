# Using Pick's theorem:
# i = A + 1 - b / 2 ; i = interior integral lattice points, b = boundary integral lattice points, A = Area of quadrilateral
# Boundary Points on a line pq can be calculated as:
# b = GCD(abs(p.x - q.x), abs(p.y - q.y)) - 1 as shown here: https://www.geeksforgeeks.org/number-integral-points-two-points/
# A = (a + c) * (b + d) / 2 ; Area of quadrilateral = d1 * d2 / 2

# $gcds = {}

def area(a, b, c, d)
  (a + c) * (b + d) / 2
end

def boundary(a, b, c, d)
  # $gcds[[c, b]] + $gcds[[c, d]] + $gcds[[a, d]] + $gcds[[a, b]]
  $gcds[c][b] + $gcds[c][d] + $gcds[a][d] + $gcds[a][b]
end

m = 100 # ~27 seconds
squares = [false] * 4 * m * m # Max value of i ~ Max value of A = m^2 * 4
1.upto(2 * m).each { |t| squares[t * t] = true}

# Precal all combinations of gcd
# (1..m).each do |a|
#   $gcds[[a, a]] = a
#   (1..m).each do |b|
#     $gcds[[a, b]] = $gcds[[b, a]] = a.gcd(b)
#   end
# end

# 2d array lookup is faster than  hash lookup (8 min to 27 seconds)
$gcds = (0..m).map{ |a| (0..m).map{ |b| a.gcd(b) } }

count = 0
(1..m).each do |a|
  puts "Solving for a = #{a}"
  (1..m).each do |b|
    (1..m).each do |c|
      (1..m).each do |d|
        inside = area(a, b, c, d) + 1 - boundary(a, b, c, d) / 2
        count += 1 if squares[inside]
      end
    end
  end
end
puts count