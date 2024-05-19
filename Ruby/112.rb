# Brute force
# Answer: 1587000; Time: 8.574779 seconds

def ascending?(arr)
  # arr == arr.sort
  0.upto(arr.size - 2).each do |i|
    return false if arr[i] > arr[i + 1]
  end
  true
end

def descending?(arr)
  # arr == arr.sort.reverse
  0.upto(arr.size - 2).each do |i|
    return false if arr[i] < arr[i + 1]
  end
  true
end

def bouncy?(num)
  arr = num.to_s.chars.map(&:to_i)
  !ascending?(arr) && !descending?(arr)
end

time = Time.now

bouncy_numbers = []
num = 1
loop do
  bouncy_numbers << num if bouncy?(num)
  if bouncy_numbers.count / num.to_f >= 0.99
    puts num
    break
  end
  num += 1
end
puts "#{Time.now - time} seconds"