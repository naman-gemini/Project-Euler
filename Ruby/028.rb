# If x is the length of a side, then each of the corners can be expressed in following form:
# x follows the pattern of odd numbers => 1, 3, 5, 7 ... 1001
# Top right: x^2
# Top left: x^2 - (x - 1) => x^2 - x + 1
# Bottom left: x^2 - x + 1 - (x - 1) => x^2 - 2x + 2
# Bottom right: x^x - 2x + 2 - (x - 1) => x^2 - 3x + 3
# Total: 2(2x^2 - 3x + 3)

sum = 1
(3..1001).step(2).each do |x|
  sum += 2 * (2 * x * x - 3 * x + 3)
end
puts sum