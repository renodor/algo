# frozen_string_literal: true

require 'rspec'

# problem: Define a function that outputs the numbers
# that appear an odd number of time in an array

def odd_repetitions_array(arr)
  # initialize a new hash with 0 as default value
  numbers = Hash.new(0)
  results = []

  # Count each time a number appear in array by adding it to the hash
  arr.each { |num| numbers[num] += 1 }

  # iterate over hash, add to result every odd number
  numbers.each { |key, value| results << key if value.odd? }

  results
end

describe 'odd repetitions_array' do
  it 'find odd numbers of time for [1,2,3]' do
    expect(odd_repetitions_array([1, 2, 3])).to eq([1, 2, 3])
  end

  it 'find odd numbers of time for [1,2,3,1]' do
    expect(odd_repetitions_array([1, 2, 3, 1])).to eq([2, 3])
  end

  it 'find odd numbers of time for [1,1,1,1,1]' do
    expect(odd_repetitions_array([1, 1, 1, 1, 1])).to eq([1])
  end

  it 'find odd numbers of time for [1,1,2,2]' do
    expect(odd_repetitions_array([1, 1, 2, 2])).to eq([])
  end
end
