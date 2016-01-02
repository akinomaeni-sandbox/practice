require 'benchmark'
require 'pry-byebug'

puts "file: " + File.basename(__FILE__)
puts ""

result = Benchmark.measure do
  ## The number of palindromes be expressed in any binary, octal, decimal.

  class Fixnum
    def palindromic?(base = 10)
      str = self.to_s(base)
      str == str.reverse
    end
  end

  def palindromic?(num)
    num.palindromic? && num.palindromic?(8) && num.palindromic?(2)
  end

  i = 11
  until palindromic?(i)
    i += 2
  end

  puts i
  puts i.to_s(8)
  puts i.to_s(2)
end

puts ""
puts Benchmark::CAPTION
puts result
