# Approach: Every number n is a repunit with base n - 1. Now we have to find just one other base that does the same.
# Brute forcing a checking each number won't work as we have to go till 10**12
# Rather, we can enumerate all possible numbers with each base which will result in another repunit, 
# and thus making the number strong repunit.
# So, just calculate 111, 1111, 11111 ... for each base. These are essentially geometric progressions
# b = base
# a(n) = (b^(n + 3) - 1) / (b - 1)
# a(n) < MAX ; Calculate max value of n
# b^2 + b + 1 < MAX ; Calculate max value of b

MAX = 10**12
MAX_b = 10**6

# sum = 1
arr = [1]
(2..MAX_b).each do |b|
  max_n = (Math.log(MAX * (b - 1) + 1, b) - 3).floor
  # sum += (((b ** (max_n + 1) - 1) / (b - 1)) * b ** 3 - max_n - 1 ) / (b - 1)
  (0..max_n).each do |n|
    arr << (b ** (n + 3) - 1) / (b - 1)
  end
end

puts arr.uniq.sum
# Can't use sum formula of GP because some terms might be duplicate (:faceplam:)
