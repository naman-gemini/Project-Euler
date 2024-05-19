MAX = 1_000_000

puts (11..MAX).select { |num| num == num.to_s.each_char.map{ |ch| ch.to_i ** 5 }.sum }.sum