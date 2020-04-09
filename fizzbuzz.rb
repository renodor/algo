# frozen_string_literal: true

require 'rspec'

# problem: Write a program that prints the numbers from 1 to x
# But for multiples of three print 'Fizz' instead of the number
# and for the multiples of five print 'Buzz' instead of the number
# For numbers which are multiples of both three and five print 'FizzBuzz'.

def fizzbuzz(number)
  (1..number).each do |num|
    if (num % 15).zero?
      puts 'fizzbuzz'
    elsif (num % 5).zero?
      puts 'fizz'
    elsif (num % 3).zero?
      puts 'buzz'
    else
      puts num
    end
  end
end

describe 'fizzbuzz' do
  it 'outputs the right data' do
    expect do
      fizzbuzz(10)
    end.to output("1\n2\nbuzz\n4\nfizz\nbuzz\n7\n8\nbuzz\nfizz\n").to_stdout
  end
end
