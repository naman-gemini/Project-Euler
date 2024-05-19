# Game Strategy: To win nim-game you should leave nim sum (xor of all values) as 0

MAX = 2**30

count = 0
(1..MAX).each do |n|
  count += 1 if n ^ (2 * n) ^ (3 * n) == 0
end
puts count