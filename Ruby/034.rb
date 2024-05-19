MAX = 999_999
FACTORIALS = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

def fact_sum(num)
  num.to_s.chars.map(&:to_i).sum{ |n| FACTORIALS[n] }
end

ans = 0
3.upto(MAX).each do |num|
  if fact_sum(num) == num
    ans += num 
  end
end
puts ans