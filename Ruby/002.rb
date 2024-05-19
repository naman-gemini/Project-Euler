sum = 0

a = 1
b = 1
c = a + b
while c <= 4_000_000 do
  c = a + b
  sum += c if c % 2 == 0
  a = b
  b = c
end

puts sum