# As the numbers involved are huge, this can't be solved by brute force
# As the square has 0 in the end, the second last digit should be 0 also (squares property)
# Also, a square in form xyz00 = xyz * 100. Sqaure root of it is sqrt(xyz) * 10
# Hence, we're down to 8 digits and to make a 17 digit square
# As it ends in 9 root should end with 3 or 7
x = 101010103 # ~Math.sqrt(10203040506070809) => All 0's in gaps
y = 138902663 # ~Math.sqrt(19293949596979899) => All 9's in gaps
loop do
  y -= 1
  next unless [3, 7].include?(y % 10)
  square = y * y
  if square.to_s =~ /^1.2.3.4.5.6.7.8.9$/
    puts y * 10
    return
  end
end