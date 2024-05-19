def val(str)
  str.chars.map{ |ch| ch.ord - 'A'.ord + 1 }.sum
end

triangle_numbers = (1..100).map{ |n| n * (n+1) / 2 }
words = File.read(File.dirname(__FILE__) + '/p042_words.txt').scan(/\w+/)

puts words.map { |word| val(word) }.select { |t| triangle_numbers.include?(t) }.count