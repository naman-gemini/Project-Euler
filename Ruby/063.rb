count = 0
(1..100).each do |num|
  (1..100).each do |power|
    count += 1 if (num ** power).to_s.size == power
  end
end
puts count