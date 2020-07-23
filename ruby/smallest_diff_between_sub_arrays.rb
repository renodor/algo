require 'rspec'

# given a non empty array of at least 2 elements
# if you split this array 2 non empty sub arrays, part1 and part2
# if you sum part1, and part2
# you can take the absolute difference between those 2 numbers
# implement a function that return the smallest absolute difference that can be find
# between all sub arrays possible

# ex: [3, 1, 2, 4, 3]
# split1 :
#   - part1 = [3] ---> sum1 = 3
#   - part2 = [1, 2, 4, 3] ---> sum2 = 10
#   - |3 - 10| = 7

# split2 :
#   - part1 = [3, 1] ---> sum1 = 4
#   - part2 = [2, 4, 3] ---> sum2 = 9
#   - |4 - 9| = 5

# split3 :
#   - part1 = [3, 1, 2] ---> sum1 = 6
#   - part2 = [4, 3] ---> sum2 = 7
#   - |6 - 7| = 1

# split4 :
#   - part1 = [3, 1, 2, 4] ---> sum1 = 10
#   - part2 = [3] ---> sum2 = 3
#   - |10 - 3| = 7

# So result = 1

# (Time complexity must by O(n))

def smallest_diff_between_sub_arrays(arr)
  # write your code in Ruby 2.2
  first_part = 0
  second_part = 0
  result = 0
  arr.each_with_index do |num, i|
    next if i == arr.length - 1

    # you just need to sum the array once
    # indeed the 'second part' of the first split is the biggest one
    # no need to do this calculation again after
    if i.zero?
      first_part = arr[0]
      second_part = arr[1, arr.length - 1].inject(:+)
      result = (first_part - second_part).abs
    else
      # after that you just need to pass over one number from the second to the first part
      # and check if diff is smaller thant current result
      first_part += num
      second_part -= num
      diff = (first_part - second_part).abs
      result = diff if diff < result
    end
  end
  result
end

describe '#smallest_diff_between_sub_arrays' do
  it 'return 1 for [3, 1, 2, 4, 3]' do
    expect(smallest_diff_between_sub_arrays([3, 1, 2, 4, 3])).to eq(1)
  end
end

describe '#smallest_diff_between_sub_arrays' do
  it 'return 0 for [1, 1]' do
    expect(smallest_diff_between_sub_arrays([1, 1])).to eq(0)
  end
end

describe '#smallest_diff_between_sub_arrays' do
  it 'return 1 for [1, 2]' do
    expect(smallest_diff_between_sub_arrays([1, 2])).to eq(1)
  end
end

describe '#smallest_diff_between_sub_arrays' do
  it 'return 1 for [1, 1000]' do
    expect(smallest_diff_between_sub_arrays([1, 1000])).to eq(999)
  end
end

describe '#smallest_diff_between_sub_arrays' do
  it 'return 1 for [-10, 4, 5, 12, 7]' do
    expect(smallest_diff_between_sub_arrays([-10, 4, 5, 12, 7])).to eq(4)
  end
end

