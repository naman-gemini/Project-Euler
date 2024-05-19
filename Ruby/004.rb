def is_palindrome?(number)
  number.to_s.reverse == number.to_s
end

max = 0
product = 0
999.downto(100).each do |a|
  a.downto(100).each do |b|
    product = a * b
    max = product if product > max && is_palindrome?(product)
  end
end
puts max