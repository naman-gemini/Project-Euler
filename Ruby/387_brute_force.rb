require 'prime'

MAX = 1_000_000

def harshad?(num)
  num % (num.to_s.chars.map(&:to_i).sum) == 0
end

def right_truncable_harshad?(num)
  flag = true
  while num > 0 do
    flag &= harshad?(num)
    return false if !flag
    num /= 10
  end
  true
end

def strong_harshad?(num)
  digits_sum = num.to_s.chars.map(&:to_i).sum
  num % digits_sum == 0 && (num / digits_sum).prime?
end

sum = 0
(10..MAX).each do |n|
  next if !n.prime?
  sum += n if strong_harshad?(n / 10) && right_truncable_harshad?(n / 10)
end
puts sum