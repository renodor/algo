# frozen_string_literal: true

require 'rspec'

# problem: Write methods using RECURSION that do the following:
# sum integers between a min and max value (included)
# multiply integers between a min and max value (included)
# substract integers between a min and max value (included)
# divid integers between a min and max value (included)
# !!! don't use ruby build-in methods
# !!! use recursion

def sum(num)
  num.zero? ? num : num + sum(num - 1)
end

def product(num)
  num == 1 ? num : num * product(num - 1)
end

def substract(num)
  num == 1 ? num : substract(num - 1) - num
end

def divide(num)
  num == 1 ? num : divide(num - 1) / num
end

def test(num, operation)
  arr = (1..num).to_a
  arr.inject(operation.to_sym)
end

describe '#sum' do
  it 'Return a number' do
    expect(sum(1).class).to eq(Integer)
  end

  it 'Sum 1 to 1' do
    expect(sum(1)).to eq(test(1, '+'))
  end

  it 'Sum 1 to 10' do
    expect(sum(10)).to eq(test(10, '+'))
  end

  it 'Sum 1 to 100' do
    expect(sum(100)).to eq(test(100, '+'))
  end
end

describe '#product' do
  it 'Return a number' do
    expect(sum(1).class).to eq(Integer)
  end

  it 'product 1 to 1' do
    expect(product(1)).to eq(test(1, '*'))
  end

  it 'product 1 to 10' do
    expect(product(10)).to eq(test(10, '*'))
  end

  it 'product 1 to 100' do
    expect(product(100)).to eq(test(100, '*'))
  end
end

describe '#substract' do
  it 'must return a number' do
    expect(substract(1).class).to eq(Integer)
  end

  it 'substract 1 to 1' do
    expect(substract(1)).to eq(test(1, '-'))
  end

  it 'substract 1 to 10' do
    expect(substract(10)).to eq(test(10, '-'))
  end

  it 'substract 1 to 100' do
    expect(substract(100)).to eq(test(100, '-'))
  end
end

describe '#divide' do
  it 'must return a number' do
    expect(divide(1).class).to eq(Integer)
  end

  it 'divide 1 to 1' do
    expect(divide(1)).to eq(test(1, '/'))
  end

  it 'divide 1 to 10' do
    expect(divide(10)).to eq(test(10, '/'))
  end

  it 'divide 1 to 100' do
    expect(divide(100)).to eq(test(100, '/'))
  end
end
