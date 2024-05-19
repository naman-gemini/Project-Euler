max_p = 0
max_sols = 0

3.upto(1000).each do |p|
  sols = 0
  1.upto(p - 2).each do |a|
    a.upto(p - 1).each do |b|
      c = p - a - b
      sols += 1 if (a * a + b * b == c * c)
    end
  end
  if sols > max_sols
    max_p = p
    max_sols = sols
  end
end
puts max_p
