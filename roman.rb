#!/usr/bin/env ruby

# require 'pry-byebug'

class RomanConverter
  CONVERSION_TABLE = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000,
    "IV" => 4,
    "IX" => 9,
    "XL" => 40,
    "XC" => 90,
    "CD" => 400,
    "CM" => 900
  }

  attr_accessor :string

  def initialize(string)
    @string = string
  end

  def convert
    case string[0] # check first character
    when *is_roman then convert_roman
    when is_arabic then convert_arabic
    else
      raise 'no conversion available'
    end
  end

  private

  def is_roman
    # first character is in conversion table
    CONVERSION_TABLE.keys
  end

  def convert_roman
    result = 0
    str = string.clone
    # find the first match at the start, and add the number to total
    # shorten the match
    # do again
    # break if string is empty
    loop do 
      result += find_number_and_shorten(str)
      break if str.empty?
    end
    result
  end

  def find_number_and_shorten(str)
    CONVERSION_TABLE.keys.reverse.each do |k|
      matcher = /^#{k}/
      if matcher === str
        str.sub!(matcher, '')
        # puts 'matched', str, matcher
        return CONVERSION_TABLE[k]
      end
    end
    raise "string #{str} has no conversion"
  end

  def is_arabic
    /^\d/
  end

  def convert_arabic
    int = Integer(string) # in case it comes in the format 1_000
    raise "#{int} is out of range" if int > 3999
    result = build_roman(int.to_s)
    result
  end

  def build_roman(str)
    "#{thousands(str[0..-4])}#{hundreds(str[-3])}#{tens(str[-2])}#{ones(str[-1])}"
  end

  def thousands(numbers)
    "M" * numbers.to_i
  end

  def hundreds(numbers)
    assign_letter(numbers, one: "C", five: "D", ten: "M")
  end

  def tens(numbers)
    assign_letter(numbers, one: "X", five: "L", ten: "C")
  end

  def ones(numbers)
    assign_letter(numbers, one: "I", five: "V", ten: "X")
  end

  def assign_letter(numbers, one:, five:, ten:)
    int = numbers.to_i
    case int
    when 9 then one + ten
    when 5..8 then five + (one * (int - 5))
    when 4 then one + five
    when 1..3 then one * int
    end
  end
end

unless (ARGV.length == 1 && File.exist?(ARGV[0]))
  puts "Usage: #{$0} source.txt" 
  exit 
end

ARGF.each_line do |line| # can replace with $stdin.each for command line input
  conversion = RomanConverter.new(line.chomp)
  puts conversion.convert
end