sum = 0
(3..1000).each do |n|
  sum += n if n % 3 == 0
  sum += n if n % 5 == 0
  sum -= n if n % 15 ==0
end

puts sum