require 'benchmark'
require 'pry-byebug'

puts "file: " + File.basename(__FILE__)
puts ""

result = Benchmark.measure do
  ## 

  size = 100
  cards = Array.new(size, true)

  2.upto(size) do |i|
    (size / i).times do |j|
      k = i * (j + 1) - 1
      cards[k] = !cards[k]
    end
  end

  answer = []
  cards.each.with_index(1) do |card, index|
    answer << index if card
  end
  p answer
end

puts ""
puts Benchmark::CAPTION
puts result
