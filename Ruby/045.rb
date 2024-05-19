require 'set'
MAX = 100_000
triangles = (286..MAX).map { |n| n * (n + 1) / 2 }.to_set
pentagonals = (1..MAX).map { |n| n * (3 * n - 1) / 2 }.to_set
hexagonals = (1..MAX).map { |n| n * (2 * n - 1) }.to_set
puts triangles.select { |t| pentagonals.include?(t) && hexagonals.include?(t) }