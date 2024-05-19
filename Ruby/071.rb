# Find p and q such that p / q < a / b (a = 3 , b = 7)
# pb < qa => pb <= qa - 1 ( as all are integer)
# p <= (3q - 1) / 7
# Also we want the max value of such p / q

MAX = 1_000_000
q = MAX
num, den = 0, 1
while q >= 2 do
  p = (3 * q - 1) / 7
  fraction = p.to_f / q
  if fraction > num.to_f / den
    num = p
    den = q
  end
  q -= 1
end

puts "#{num}/#{den}"