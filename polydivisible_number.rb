require 'rspec'

def next_num(num)
  # add 1 to number
  num += 1
  # slice number at first number
  i = 1
  while i <= num.digits.length
    # check if slice is divisible by slice.length
    until (num.digits.reverse[0, i].join('').to_i % i).zero?
      # if not add 1 to number and check again
      num += 1
    end
    i += 1
  end
  num
end

describe 'Next num' do
  it 'return a number' do
    expect(next_num(1).class).to eq(Integer)
  end

  it 'return 1 for 0' do
    expect(next_num(0)).to eq(1)
  end

  it 'return 12 for 10' do
    expect(next_num(10)).to eq(12)
  end

  it 'return 12 for 11' do
    expect(next_num(11)).to eq(12)
  end

  it 'return 1236 for 1234' do
    expect(next_num(1234)).to eq(1236)
  end

  it 'return 123_252 for 123_220' do
    expect(next_num(123_220)).to eq(123_252)
  end

  it 'return 1020 for 998' do
    expect(next_num(998)).to eq(1020)
  end

  it 'return 1020 for 999' do
    expect(next_num(999)).to eq(1020)
  end

  it 'return 1_236_004_020 for 1_234_567_890' do
    expect(next_num(1_234_567_890)).to eq(1_236_004_020)
  end
end
