# frozen_string_literal: true

require 'rspec'

# problem: Define a function that outputs the numbers
# that appear an odd number of time in an array

def odd_repetitions_array(array)
  count = Hash.new(0)

  array.each { |num| count[num] += 1 }

  count.keys.select { |key| count[key].odd? }
end

describe '#odd_repetitions_array' do
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
