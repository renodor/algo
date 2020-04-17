# frozen_string_literal: true

require 'rspec'

# problem : write a function that takes a x, a number, as an argument
# and return the x first fibonacci numbers

def fibonacci_numbers(number)
  # initialize sum and sum2 at 1
  sum = 1
  num2 = 1

  # has we already have sum and num2 we need to do the operation x - 2 times
  (number - 2).times do
    # save the num2 value by assigning it to num1
    num1 = num2
    # save num2 value by assigning it to sum
    num2 = sum
    # add num1 to the sum
    sum += num1
  end
  sum
end

describe '#fibonacci_numbers' do
  it 'Find the 1 fibonacci number' do
    expect(fibonacci_numbers(1)).to eq(1)
  end

  it 'Find the 10th fibonacci number' do
    expect(fibonacci_numbers(10)).to eq(55)
  end

  it 'Find the 55th fibonacci number' do
    expect(fibonacci_numbers(55)).to eq(139583862445)
  end

  it 'Find the 100th fibonacci number' do
    expect(fibonacci_numbers(100)).to eq(354224848179261915075)
  end
end
