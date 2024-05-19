(1..1000).each do |a|
  (a..1000).each do |b|
    c = 1000 - a - b
    if a * a + b * b == c * c
      puts a * b * c
    end
  end
end