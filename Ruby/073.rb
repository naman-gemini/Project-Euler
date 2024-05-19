# Find p and q such that 1/3 < p/q < 1/2

MAX = 12_000

def gcd(a, b)
  while b != 0 do
    temp = b
    b = a % b
    a = temp
  end
  return a
end

q = MAX
count = 0

while q >= 3 do
  min_p = ((q + 1).to_f / 3).ceil
  max_p = (q - 1) / 2
  (min_p..max_p).each do |p|
    count += 1 if gcd(p, q) == 1
  end
  q -= 1
end

puts count