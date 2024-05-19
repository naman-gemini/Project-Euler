counter = 2
a, b = 1, 1
while b.to_s.size < 1000 do
  a, b = b, a + b
  counter += 1
end
puts counter