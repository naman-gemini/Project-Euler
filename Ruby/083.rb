# Dijkstra’s shortest path algorithm

class Node
  INF = 1.0/0
  attr_accessor :idx, :distance

  def initialize(idx, distance = INF)    
    @idx = idx
    @distance = distance
  end
end

matrix = []

File.open('p083_matrix.txt').read.each_line do |line|
  matrix << line.strip.split(',').map(&:to_i)
end

sums = Marshal.load(Marshal.dump(matrix))

# priority queue
pq = []

idx = 0
sz = matrix.size
0.upto(sz - 1).each do |i|
  0.upto(sz - 1).each do |j|
    pq << if idx == 0
      Node.new(idx, 0)
    else
      Node.new(idx)
    end
    idx += 1
  end
end

while !pq.empty? do
  u = pq.min_by { |node| node.distance }
  pq.delete(u)
  row = u.idx / sz
  col = u.idx % sz
  # calculate distance of adjacent nodes (all directions) which are still in pq
  adjacent_node_indices = []
  adjacent_node_indices << [row - 1, col] if row - 1 >= 0 && !pq.find { |node| node.idx == (row - 1) * sz + col }.nil?
  adjacent_node_indices << [row, col + 1] if col + 1 < sz && !pq.find { |node| node.idx == row * sz + col + 1 }.nil?
  adjacent_node_indices << [row + 1, col] if row + 1 < sz && !pq.find { |node| node.idx == (row + 1) * sz + col }.nil?
  # adjacent_node_indices << [row, col - 1] if col - 1 >= 0 && !pq.find { |node| node.idx == row * sz + col - 1 }.nil?
  adjacent_node_indices.each do |adjacent_node_index|
    i, j = adjacent_node_index
    new_distance = sums[row][col] + matrix[i][j]
    k = pq.find_index { |node| node.idx == i * sz + j }
    old_distance = pq[k].distance
    if old_distance > new_distance
      sums[i][j] = new_distance
      pq[k].distance = new_distance
    end
  end
end

puts sums[sz - 1][sz - 1]

# We're using a simple array to implement priority queue. We can optimize Dijkstra’s by using heap for a priority queue.