fileInfo = IO.readlines("p022_names.txt")
names = fileInfo.first.split(",").map{ |name| name.gsub("\"", "") }.sort

sum = 0
names.each_with_index do |name, index|
  sum += name.each_char.map { |ch| ch.ord - 'A'.ord + 1 }.sum * (index + 1)
end

puts sum