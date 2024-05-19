# get all lines in a string
fileInfo = IO.readlines("p067_triangle.txt")
matrix = []

fileInfo.each do |line|
  matrix << line.gsub("\n", "").split(" ").map(&:to_i)
end

matrix.each_with_index do |row, i|
  row.each_with_index do |_, j|
    next if i == 0
    if j == 0
      matrix[i][j] += matrix[i - 1][j]
    else
      matrix[i][j] += [matrix[i - 1][j - 1], matrix[i - 1][j] || 0].max
    end
  end
end

puts matrix.last.max