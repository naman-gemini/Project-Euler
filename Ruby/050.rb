require 'prime'
require 'set'
MAX = 1_000_000
$primes = (2..MAX).select { |n| n.prime? }

def solve
  x = ans = 5000
  # keep changing this upper bound till you get the answer
  loop do
    $primes.each_cons(x).each do |arr|
      sum = arr.sum
      # if one iteration is over sum others would be too, as they come in a sorted manner
      break if sum > MAX
      if sum.prime?
        return [x, sum]
      end
    end
    x -= 1
  end
end

puts solve