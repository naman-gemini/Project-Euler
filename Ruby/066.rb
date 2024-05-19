# *************** DOESN'T WORK ***************
# Refer: https://www.mathblog.dk/project-euler-66-diophantine-equation/

MAX = 1_00_000
SQUARES = (1..MAX).each_with_object({}) { |n, h| h[n* n] = true }

max = 0
ans = 1000
(1..1000).each do |d|
  next if SQUARES[d] == true
  (1..100_000).each do |y|
    x2 = 1 + d * y * y
    if SQUARES[x2] == true && x2 > max
      puts "x2 = #{x2} y = #{y} d = #{d} max = #{max}"
      max = x2
      ans = d
      break
    end
  end
end

puts ans