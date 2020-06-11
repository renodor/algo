require 'rspec'

# problem: https://leetcode.com/problems/container-with-most-water/

def max_area(height)
  j = h_space = height.length - 1
  i = max_area = 0
  (height.length - 1).times do
    if height[i] > height[j]
      max_area = height[j] * h_space if (height[j] * h_space) > max_area
      j -= 1
    else
      max_area = height[i] * h_space if (height[i] * h_space) > max_area
      i += 1
    end
    h_space -= 1
  end
  max_area
end


describe '#max_area' do
  it 'return 49 for [2,0]' do
    expect(max_area([2, 0])).to eq(0)
  end

  it 'return 49 for [1,8,6,2,5,4,8,3,7]' do
    expect(max_area([1, 8, 6, 2, 5, 4, 8, 3, 7])).to eq(49)
  end

  it 'return 4 for [1, 2, 3, 4]' do
    expect(max_area([1, 2, 3, 4])).to eq(4)
  end

  it 'return 36 for [2, 3, 10, 5, 7, 8, 9]' do
    expect(max_area([2, 3, 10, 5, 7, 8, 9])).to eq(36)
  end

  it 'return 17 for [2, 3, 4, 5, 18, 17, 6]' do
    expect(max_area([2, 3, 4, 5, 18, 17, 6])).to eq(17)
  end

  it 'return 24 for [1, 2, 3, 4, 5, 25, 24, 3, 4]' do
    expect(max_area([1, 2, 3, 4, 5, 25, 24, 3, 4])).to eq(24)
  end

  it 'return 25 for [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]' do
    expect(max_area([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])).to eq(25)
  end
end
