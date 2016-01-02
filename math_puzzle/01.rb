require 'benchmark'
require 'pry-byebug'

puts "file: " + File.basename(__FILE__)
puts ""

result = Benchmark.measure do
  ## The number of palindromes be expressed in any binary, octal, decimal.

  class Fixnum
    def palindromic?(base = 10)
      str = self.to_s(base)
      size = str.size
      t = (size) / 2
      0.upto(t) do |i|
        return false unless str[i] == str[ -1 * (i + 1) ]
      end
      return true
    end
  end

  def palindromic?(num)
#    [10, 8, 2].each do |base|
#      return false if num.palindromic? base
#    end
    return false unless num.palindromic? 10
    return false unless num.palindromic? 8
    return false unless num.palindromic? 2
    return true
  end

  10.upto(585) do |i|
    if palindromic?(i)
      puts i
      puts i.to_s(8)
      puts i.to_s(2)
    end
  end
end

puts ""
puts Benchmark::CAPTION
puts result
