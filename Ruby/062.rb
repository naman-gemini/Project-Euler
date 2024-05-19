MAX = 10_000
CUBES = (345..MAX).map { |n| n * n * n}

sorted = {}
frequency = Hash.new(0)

CUBES.each do |cube|
  sorted_string = cube.to_s.chars.sort.join 
  sorted[cube] = sorted_string
  frequency[sorted_string] += 1
end

max_freq_sorted_string = frequency.select { |_, v| v == 5 }.keys.first
puts sorted.select { |_, v| v == max_freq_sorted_string }.keys.first