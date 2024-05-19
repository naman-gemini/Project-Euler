MAX = 10**8

def check?(n)
  (n + n.to_s.reverse.to_i).to_s.chars.any? { |t| t.to_i % 2 == 0 }
end

time = Time.now

count = 0
(10..MAX).each do |n|
  if n % 10 != 0
    count += 1 if !check?(n)
  end
end

puts count
puts "#{Time.now - time} seconds"


# 2 -> 0.00009 (20)
# 3 -> 0.002 (120)
# 4 -> 0.014 (720)
# 5 -> 0.168 (720)
# 6 -> 2.1 (18720)
# 7 -> 17 (68720)
# 8 -> 186 (608720)

# It can be done on paper by using digit combinations necessary to make each number odd. Starting
# from 2 digits and building the answer to 9 digits.