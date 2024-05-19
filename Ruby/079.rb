# Can do by hand. By 15th iteration you can be sure answer is 73162890
# 
# Actual solution should be as per topological sort
# Saving graph as Adjacency List (Hash of arrays)
# 2 => [4, 5, 6] denotes there's a directed edge from 2 to 4, 5 and 6
# NOTE: Ignore the temporary hash if it's DAG for sure
# permanent hash is basically the visited array

NotDAG = Class.new(StandardError)

# fill nodes
def make_graph_structure
  nodes = []
  File.open("p079_keylog.txt").read.each_line do |line|
    nodes << line.to_s.chars.map(&:to_i)
  end
  nodes = nodes.flatten.uniq
  graph = {}
  nodes.each { |node| graph[node] = [] }
  graph
end

# fill edges
def draw_edges(graph)
  File.open("p079_keylog.txt").read.each_line do |line|
    graph[line[0].to_i] << line[1].to_i
    graph[line[1].to_i] << line[2].to_i
    graph[line[0].to_i] << line[2].to_i
  end
  graph.each { |k, v| graph[k] = v.uniq}
  graph
end

# based on DFS (https://en.wikipedia.org/wiki/Topological_sorting#Depth-first_search)
# A good implementation is here: https://www.geeksforgeeks.org/topological-sorting/
def topological_sort(graph)
  list = []
  permanent = graph.keys.each_with_object({}) { |node, hsh| hsh[node] = false }
  temporary = graph.keys.each_with_object({}) { |node, hsh| hsh[node] = false }
  loop do
    k = permanent.select { |_, v| v == false}.keys.first
    break if k.nil?
    visit(graph, list, k, permanent, temporary)
  end
  list
end

def visit(graph, list, node, permanent, temporary)
  return if permanent[node]
  raise NotDAG, "Not a Directed Acyclic Graph" if temporary[node]
  temporary[node] = true
  graph[node].each do |adjacent_node|
    visit(graph, list, adjacent_node, permanent, temporary)
  end
  permanent[node] = true
  list.prepend(node)
end

graph = make_graph_structure
graph = draw_edges(graph)
puts topological_sort(graph).join("")