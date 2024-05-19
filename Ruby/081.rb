# Simple dynamic programming
# For every cell, best option till now is min of up and left

matrix = []

File.open('p081_matrix.txt').read.each_line do |line|
  matrix << line.strip.split(',').map(&:to_i)
end

INF = 1.0/0
0.upto(matrix.size - 1).each do |row|
  0.upto(matrix.first.size - 1).each do |col|
    next if row == 0 && col == 0
    matrix[row][col] += [row - 1 >= 0 ? matrix[row - 1][col] : INF, col - 1 >= 0 ? matrix[row][col - 1] : INF].min
    # puts "row = #{row}, col = #{col}, cell = #{matrix[row][col]}"
  end
end

# puts matrix[0].join(",")
# puts matrix.map { |t| t.join(",")}
puts matrix[matrix.size - 1][matrix.first.size - 1]