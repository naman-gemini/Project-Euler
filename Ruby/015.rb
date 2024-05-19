# 1 extra row and column as we have to create a grid (2 x 2 grid has basically 3 x 3 points)
n = 21 # rows
m = 21 # columns

# n x m 2D array
matrix = Array.new(n) { Array.new(m) }

# initialize first row and first column
0.upto(n-1).each do |row|
  0.upto(m-1).each do |column|
    if row == 0 || column == 0
      matrix[row][column] = 1
    else
      matrix[row][column] = 0
    end
  end
end

# calculate matrix[n][m]
1.upto(n-1).each do |row|
  1.upto(m-1).each do |column|
    matrix[row][column] = matrix[row - 1][column] + matrix[row][column - 1]
  end
end

puts matrix[n - 1][m - 1]
# puts matrix.map { |x| x.join(' ') }