# Best explanation of dynamic programming approach is here: 
# https://www.mathblog.dk/project-euler-82-find-the-minimal-path-sum-from-the-left-column-to-the-right-column/
# But we'll modify it a bit, we'll iterate from left to right. 
# As we did in problem 81, I think it's more intuitive
# Answer will be in right most column instead of left most column

matrix = []
INF = 1.0/0

File.open('p082_matrix.txt').read.each_line do |line|
  matrix << line.strip.split(',').map(&:to_i)
end


# Iterate from left column to right column
# We divide every column in 2 parts/iterations: 1st up to down, then down to up
# In 1st iteration we consider path coming from left and top (take min from both)
# In 2nd iteration we consider path coming from bottom (take min from this and previous iteration solution)
# Do this for each cell left to right (column wise). We'll have answer in last column (right most column)
## The reason we're able to partition problem in these 2 parts is:
## "If we find that the minimal path is to go up, the minimal path for the entry above cannot be to go down."

# So we'll need 2 matrices here. 1 to keep original matrix, 1 to keep minimums.
# NOTE: We won't modify the original matrix at all
sums = Marshal.load(Marshal.dump(matrix))
sz = matrix.size # same rows and columns
1.upto(sz - 1).each do |col| # skip 1st column
  # 1st iteration (top to bottom)
  0.upto(sz - 1).each do |row|
    sums[row][col] += [sums[row][col - 1], row - 1 >= 0 ? sums[row - 1][col] : INF].min # min of left and up
  end
  # 2nd iteration (bottom to top)
  (sz - 2).downto(0).each do |row| # Skip last row (bottom most). It can't pick from bottom cell.
    sums[row][col] = [matrix[row][col] + sums[row + 1][col], sums[row][col]].min # min of bottom and previous solution from first iteration
  end
end

# Answer is min of last column
min = INF
0.upto(sz - 1).each do |row|
  min = sums[row][sz - 1] if sums[row][sz - 1] < min
end

# This can be done by graph traversal algorithms as well (like BFS)
puts min