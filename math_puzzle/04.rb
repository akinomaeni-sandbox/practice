require 'benchmark'
require 'pry-byebug'

puts "file: " + File.basename(__FILE__)
puts ""

result = Benchmark.measure do
  ## 

  def count(n, m)
    c = 0

    while n > 0
      n -= [m, 2**c].min
      c += 1
    end

    c
  end

  puts count 20, 3
  puts count 100, 5
end

puts ""
puts Benchmark::CAPTION
puts result
