# Brute force
# Answer: 14234; Time: 1.44093 seconds

MAX = 50

time = Time.now

count = 0
(0..MAX).each do |x1|
  (0..MAX).each do |y1|
    (0..MAX).each do |x2|
      (0..MAX).each do |y2|
        next if x1 == x2 && y1 == y2 # P and Q are same points
        next if (x1 == 0 && y1 == 0) || (x2 == 0 && y2 == 0) # P or Q is origin
        a = x1 * x1 + y1 * y1
        b = x2 * x2 + y2 * y2
        c = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1)       
        count += 1 if (a == b + c) || (b == a + c) || (c == a + b)
        end
      end
    end
  end
end

puts count / 2 # P and Q are interchangable
puts "#{Time.now - time} seconds"