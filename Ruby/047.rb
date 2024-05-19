require 'prime'

puts (1..1000000).each_cons(4).find { |nums| 
  nums.all? { |n| n.prime_division.length == 4 } 
}.first