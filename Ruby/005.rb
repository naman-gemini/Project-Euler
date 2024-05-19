def gcd(a, b)
  while b != 0 do
    temp = b
    b = a % b
    a = temp
  end
  return a
end

a = 1
lcm = 1
2.upto(20).each do |b|
  lcm = (a * b) / gcd(a, b)
  a = lcm
end
puts lcm