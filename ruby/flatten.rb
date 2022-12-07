# frozen_string_literal: true

require 'rspec'
require 'pry'

# problem: Define a function that flattens an array of nested arrays
# (without using the build-in #flatten ruby method)

def flatten(arr, result = [])
  arr.each do |el|
    # check if the element is itself an array
    # (meaning the array is not flatten yet)
    if el.is_a?(Array)
      # if yes, call the function again on this specific array
      # saving the result (if it exist) as the second argument
      flatten(el, result)
    else
      # if no, this specific array is flatten,
      # so we can put the element in result
      result << el
    end
  end

  result
end

describe '#flatten' do
  it 'returns non nested array' do
    expect(flatten([1, 2, 3])).to eq([1, 2, 3])
  end

  it 'flattens nested array level 1' do
    expect(flatten([[1, 2, 3], [4, 5, 6]])).to eq([1, 2, 3, 4, 5, 6])
  end

  it 'flattens nested level 2' do
    expect(flatten([1, 2, 3, %w[a b c], [4, 5, 6]]))
      .to eq([1, 2, 3, 'a', 'b', 'c', 4, 5, 6])
  end

  it 'flattens nested level 3' do
    expect(flatten([[1, 2, 3, ['a', %w[X Y Z], 'b', 'c']], [4, 5, [6], 7]]))
      .to eq([1, 2, 3, 'a', 'X', 'Y', 'Z', 'b', 'c', 4, 5, 6, 7])
  end

  it 'flattens nested level 8' do
    expect(flatten([[[[[[[1], 2, 3], ['a']], [['X', 'Y', [['Z'], 'b', 'c']], [4, 5]], [6]]], 7]]))
      .to eq([1, 2, 3, 'a', 'X', 'Y', 'Z', 'b', 'c', 4, 5, 6, 7])
  end
end
