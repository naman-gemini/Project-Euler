require 'prime'

MAX = 10**14

def harshad?(num)
  num % (num.to_s.chars.map(&:to_i).sum) == 0
end

def strong_harshad?(num)
  digits_sum = num.to_s.chars.map(&:to_i).sum
  num % digits_sum == 0 && (num / digits_sum).prime?
end

sum = 0

# This queue should only have harshad numbers
# BFS to generate harshad numbers
q = Queue.new
(1..9).each { |t| q << t }

while !q.empty? do
  num = q.pop
  # puts num
  (0..9).each do |n|
    new_num = num * 10 + n
    next if new_num > MAX
    if strong_harshad?(num) && new_num.prime?
      sum += new_num
      # puts "Adding #{new_num} to sum"
    end
    q.push(new_num) if harshad?(new_num)
  end
end
# puts "*"*10
puts sum