require 'rspec/autorun'
# Define a function that outputs the numbers that appear an odd number of time in an array


def odd_repetitions_array(arr)
  # create an empty hash
  numbers = {}
  # create an empty result array
  results = []

  # iterate over array
  arr.each do |num|
    # if hash[number] exist, add one to it. otherwise create it
    numbers[num] ? numbers[num] += 1 : numbers[num] = 1
  end

  # iterate over hash, add to result array every odd number
  numbers.each do |key, value|
    results << key if value.odd?
  end

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
