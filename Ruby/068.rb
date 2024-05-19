# Numbering from top like
# a0 a1
# a2
# a3 a4
# a5 a6 a7 a8
# a9

ORDER = {
  0 => "024147876963532",
  1 => "147876963532024", 
  8 => "876963532024147", 
  9 => "963532024147876", 
  5 => "532024147876963"
}

def min_external_node(arr)
  external_nodes = [arr[0], arr[1], arr[8], arr[9], arr[5]]
  min_node = external_nodes.min
  min_node_index = external_nodes.index(min_node)
  mapping = [0, 1, 8, 9, 5]
  mapping[min_node_index]
end

def generate_string(arr, node)
  str = ""
  ORDER[node].split('').each do |index|
    str += arr[index.to_i].to_s
  end
  str
end

ans_arr = []
(1..10).to_a.permutation.to_a.each do |arr|
  sum = arr[0] + arr[2] + arr[4]
  if (arr[1] + arr[4] + arr[7] == sum) && (arr[6] + arr[7] + arr[8] == sum) && (arr[3] + arr[6] + arr[9] == sum) &&
    (arr[2] + arr[3] + arr[5] == sum)
    starting_node = min_external_node(arr)
    ans_string = generate_string(arr, starting_node)
    ans_arr << ans_string if ans_string.size == 16
  end
end

puts ans_arr.max