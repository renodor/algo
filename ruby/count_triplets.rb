# frozen_string_literal: true

require 'rspec'

# problem: https://www.hackerrank.com/challenges/count-triplets-1/problem

def count_triplets(arr, ratio)
  # will store numbers that are part of a duet (initalizing at 0)
  duets = Hash.new(0)

  # will store numbers that are part of a triplet (initalizing at 0)
  triplets = Hash.new(0)

  # will count the number of complete triplets
  count = 0

  arr.each do |num|
    # for each number we will perform 3 operations

    # 1 see if this number was needed to form one or several new triplets
    # if yes, increment the counter
    count += triplets[num] if triplets[num]

    # 2 see if this number was needed to form one or several new duets
    # if yes, add to the triplets hash num * ratio
    # which is the next number needed to form the corresponding triplet
    triplets[num * ratio] += duets[num] if duets[num]

    # 3 add num * ratio to the duet hash
    # Like that we know what is the next number we need to complete this duet
    duets[num * ratio] += 1
  end
  count
end

describe '#count_triplets' do
  it 'return a number' do
    expect(count_triplets([1, 2, 3], 2).class).to eq(Integer)
  end

  it 'return 2 for [1,2,2,4], 2' do
    expect(count_triplets([1, 2, 2, 4], 2)).to eq(2)
  end

  it 'return 6 for [1, 3, 9, 9, 27, 81], 3' do
    expect(count_triplets([1, 3, 9, 9, 27, 81], 3)).to eq(6)
  end

  it 'return 4 for [1, 3, 9, 9, 27, 81], 5' do
    expect(count_triplets([1, 5, 5, 25, 125], 5)).to eq(4)
  end
end
