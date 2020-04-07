# frozen_string_literal: true

require 'rspec/autorun'

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

# def fizzbuzz2(n)
#   (1..n).map  { |i| (a = "#{['fizz'][i % 5]}#{['buzz'][i % 3]}").empty? ? i : a }
#         .each { |a| puts a }
# end

describe 'fizzbuzz' do
  it 'outputs the right data' do
    expect do
      fizzbuzz(10)
    end.to output("1\n2\nbuzz\n4\nfizz\nbuzz\n7\n8\nbuzz\nfizz\n").to_stdout
  end
end
