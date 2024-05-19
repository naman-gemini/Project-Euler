a, b = 1, 1
count = 0
1000.times do
  a, b = a + 2 * b, a + b
  count += 1 if a.to_s.length > b.to_s.length
end
print count