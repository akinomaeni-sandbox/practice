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
  @opereters = [ "*", ""]

  def insert_opereters(strs, index)
    strings = []

    strs.each do |str|
      @opereters.each do |o|
        next if str[index] == "0"

        string = str.clone
        strings << string.insert(index, o)
      end
    end

    strings
  end

  def get_strings(num)
    strings = []

    strs = [num.to_s]
    3.downto(1) do |i|
      strs = insert_opereters(strs, i)
    end

    strs.each do |str|
      strings << str unless str.length == 4
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
