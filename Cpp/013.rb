# get all lines in a string
fileInfo = IO.readlines("euler13file.txt")
sum = 0

for i in 0..fileInfo.length-1
   sum += fileInfo[i].to_i
end

puts "sum is #{sum}"