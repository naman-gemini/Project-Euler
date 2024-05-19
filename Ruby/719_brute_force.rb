# Algo (Brute force):
# Iterate through 10^6 numbers and find their squares
# For the squared number, find all partitions of the number (just how you partition a string) in 2**(n-1) ways where n is number of digits in squared number
# If sum of the partition is equal to initial number, then add it to sum and continue to next number

LIMIT = 10**6 # we have to find T(10**12)


def find_partitions(s)
  return [[]] if s.empty?
    
  partitions = []
  (1..s.length).each do |i|
    prefix = s[0, i]
    suffix = s[i..-1]
    find_partitions(suffix).each do |partition|
      partitions << [prefix] + partition
    end
  end
  partitions
end

t1 = Time.now
ans = 0
(2..LIMIT).each do |num|
  sq = num * num
  partitions = find_partitions(sq.to_s)
  partitions.each do |partition|
    if partition.map(&:to_i).sum == num
      ans += sq
      puts sq
      break
    end
  end
end
puts ans

puts "Time taken: #{Time.now - t1} seconds"
# Time taken: 3064.2857146 seconds