ans = 0
(1..100).each do |a|
  (1..100).each do |b|
    next if a == b
    ans += a * b
  end
end
puts ans