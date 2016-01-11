require 'benchmark'
require 'pry-byebug'

puts "file: " + File.basename(__FILE__)
puts ""

result = Benchmark.measure do
  ## The number of palindromes be expressed in any binary, octal, decimal.

  class Fixnum
    def reversed?(num)
      self.to_s.reverse == num.to_s
    end
  end

  answer = []
  @opereters = [ " * ", ""]

  def insert_opereters(string, index)
    strings = []
    @opereters.each do |o|
      str = string.clone
      next if str[index] == "0"
      strings << str.insert(index, o)
    end
    strings
  end

  def get_strings(num)
    strings = []
    insert_opereters(num.to_s, 3).each do |str|
      insert_opereters(str, 2).each do |str2|
        insert_opereters(str2, 1).each do |str3|
          next if str3.length == 4
          strings << str3
        end
      end
    end
    strings
  end

  1000.upto(9999) do |i|
    next if i % 10 == 0
    get_strings(i).each do |str|
      if i.reversed? eval(str)
        puts "#{str} = #{eval(str)}"
        answer << i
        break
      end
    end
  end

  puts answer
end

puts ""
puts Benchmark::CAPTION
puts result
