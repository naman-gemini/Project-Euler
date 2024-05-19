# If x is the length of a side, then each of the corners can be expressed in following form:
# x follows the pattern of odd numbers => 1, 3, 5, 7 ... 1001
# Bottom right: x^2
# Bottom left: x^2 - (x - 1) => x^2 - x + 1
# Top left: x^2 - x + 1 - (x - 1) => x^2 - 2x + 2
# Top right: x^x - 2x + 2 - (x - 1) => x^2 - 3x + 3

require 'prime'
side = 3
cnt = 0
loop do
  diagonal_numbers_count = (side / 2) * 4 + 1
  a = side * side - 3 * side + 3
  b = side * side - 2 * side + 2
  c = side * side - side + 1
  cnt += 1 if a.prime?
  cnt += 1 if b.prime?
  cnt += 1 if c.prime?
  if cnt / diagonal_numbers_count.to_f < 0.1
    puts side
    break
  end
  side += 2
end