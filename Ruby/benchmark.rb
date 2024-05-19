require 'Benchmark'
require 'prime'

t = Benchmark.measure do
  (2..1000000).each do |x|
    x.prime_division
  end
end
puts t