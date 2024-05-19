# a + p/q
def add(a, p, q)
  [a * q + p, q]
end

cnt = 0
(1..1000).each do |iterations|
  num = 1
  den = 2
  (iterations - 1).times do
    den, num = add(2, num, den)
  end
  # puts add(1, num, den).join("/")
  num, den = add(1, num, den)
  cnt += 1 if num.to_s.size > den.to_s.size
end
puts cnt