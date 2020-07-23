require 'rspec'

# PROBLEM:

# An array A consisting of N integers is given.
# Rotation of the array means that each element is shifted right by one index,
# and the last element of the array is moved to the first place.
# For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7]

# The goal is to rotate array A, K times; that is, each element of A will be shifted to the right K times.

# write a function array_rotation that given an array and an integer, returns the array A rotated K times.

def array_rotation(array, rotations)
  # write your code in Ruby 2.2
  result = []
  array.each_with_index do |num, i|
    complete_rotations = (i + rotations) / array.length
    moves_realised = complete_rotations * array.length
    remaining_moves = rotations - moves_realised
    result[i + remaining_moves] = num
  end
  result
end

describe '#array_rotation' do
  it 'should return [9, 7, 6, 3, 8] for [3, 8, 9, 7, 6] rotated 3 times' do
    expect(array_rotation([3, 8, 9, 7, 6], 3)).to eq([9, 7, 6, 3, 8])
  end
end

describe '#array_rotation' do
  it 'should return [0, 0, 0] for [0, 0, 0] rotated 1 time' do
    expect(array_rotation([0, 0, 0], 1)).to eq([0, 0, 0])
  end
end

describe '#array_rotation' do
  it 'should return [1] for [1] rotated 100 times' do
    expect(array_rotation([1], 100)).to eq([1])
  end
end

describe '#array_rotation' do
  it 'should return [1, 2, 3, 4] for [1, 2, 3, 4] rotated 4 times' do
    expect(array_rotation([1, 2, 3, 4], 4)).to eq([1, 2, 3, 4])
  end
end

describe '#array_rotation' do
  it 'should return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] for [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] rotated 10 times' do
    expect(array_rotation([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 10)).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
  end
end

describe '#array_rotation' do
  it 'should return [8, 9, 10, 1, 2, 3, 4, 5, 6, 7] for [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] rotated 3 times' do
    expect(array_rotation([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3)).to eq([8, 9, 10, 1, 2, 3, 4, 5, 6, 7])
  end
end
