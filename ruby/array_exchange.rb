# frozen_string_literal: true

require 'rspec'

# problem: https://www.codewars.com/kata/5353212e5ee40d4694001114/train/ruby

class Array
  def exchange_with!(other_array)
    # duplicate the current array and save it in a variable
    save = dup

    # replace current array by 'other_array' reversed
    replace(other_array.reverse)

    # replace 'other_array' by the current array (saved) reversed
    other_array.replace(save.reverse)
  end
end

describe '#exchange_with!' do
  context 'With array1 = [1, 2, 3] and array2 = [a, b, c]'
  array1 = [1, 2, 3]
  array2 = %w[a b c]
  array1.exchange_with!(array2)
  it 'replace array1 by array2 and reverse it' do
    expect(array1).to eq(%w[c b a])
  end

  it 'replace array2 by array1 and reverse it' do
    expect(array2).to eq([3, 2, 1])
  end
end
