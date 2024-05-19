def area(x1, y1, x2, y2, x3, y3)
  ((x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)) / 2.0).abs
end

# Let's say if P(0,0) lies in triangle ABC
# Then Area ABC = Area PAB + Area PBC + Area PAC
def contains_origin?(coordinates)
  x1, y1, x2, y2, x3, y3 = coordinates
  area(x1, y1, x2, y2, x3, y3) == (
    area(x1, y1, x2, y2, 0, 0) +
    area(x1, y1, 0, 0, x3, y3) +
    area(0, 0, x2, y2, x3, y3)
  )
end

count = 0
File.open('p102_triangles.txt').read.each_line do |line|
  coordinates = line.strip.split(',').map(&:to_i)
  count += 1 if contains_origin?(coordinates)
end
puts count