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

  def insert_opereters(original_strings, index)
    strings = []

    original_strings.each do |original_string|
      @opereters.each do |opereter|
        next if original_string[index] == "0"

        string = original_string.clone
        strings << string.insert(index, opereter)
      end
    end

    strings
  end

  def get_expressions(num)
    expressions = []

    strings = [num.to_s]
    3.downto(1) do |i|
      strings = insert_opereters(strings, i)
    end

    strings.each do |string|
      expressions << string unless string.length == 4
    end

    expressions
  end

  1000.upto(9999) do |i|
    next if i % 10 == 0

    get_expressions(i).each do |expression|
      if i.reversed? eval(expression)
        puts "#{expression} = #{eval(expression)}"
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
