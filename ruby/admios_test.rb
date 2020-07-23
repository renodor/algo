require 'rspec'

# Write a function:

# def solution(a)

# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

# Given A = [1, 2, 3], the function should return 4.

# Given A = [−1, −3], the function should return 1.

# Write an efficient algorithm for the following assumptions:

def smallest_not_in_array(array)
  sorted_array = array.sort

  sorted_array.each_with_index do |number, i|
    return number + 1 if number.positive? && number + 1 != sorted_array[i + 1] && number != sorted_array[i + 1]
  end
  1
end

describe '#solution' do
  it 'return 4 for [1, 3, 6, 4, 1, 2]' do
    expect(smallest_not_in_array([1, 3, 6, 4, 1, 2])).to eq(5)
  end

  it 'return 4 for [1, 2, 3]' do
    expect(smallest_not_in_array([1, 2, 3])).to eq(4)
  end

  it 'return 4 for [-1, -3]' do
    expect(smallest_not_in_array([-1, -3])).to eq(1)
  end
end
