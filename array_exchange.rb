require 'rspec'

class Array
  def exchange_with!(other_array)
    # your code here
    save = self.dup
    self.replace(other_array.reverse)
    other_array.replace(save.reverse)
  end
end

describe 'Exchange array' do
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
