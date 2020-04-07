# frozen_string_literal: true

require 'rspec/autorun'

def fibonacci_numbers(number)
  sum = 1
  num2 = 1

  (number - 2).times do
    num1 = num2
    num2 = sum
    sum += num1
  end

  sum
end

describe 'fibonacci numbers' do
  it 'Find the 1 fibonacci number' do
    expect(fibonacci_numbers(1)).to eq(1)
  end

  it 'Find the 10th fibonacci number' do
    expect(fibonacci_numbers(10)).to eq(55)
  end

  it 'Find the 55th fibonacci number' do
    expect(fibonacci_numbers(10)).to eq(55)
  end
end



