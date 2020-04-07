require 'rspec'

def digital_root(num)
  num < 10 ? num : digital_root(num.digits.inject(:+))
end

describe 'Digital root' do
  it 'return a number' do
    expect(digital_root(1).class).to eq(Integer)
  end

  it 'return 7 for 16' do
    expect(digital_root(16)).to eq(7)
  end

  it 'return 6 for 456' do
    expect(digital_root(456)).to eq(6)
  end

  it 'return 6 for 132189' do
    expect(digital_root(132_189)).to eq(6)
  end

  it 'return 2 for 493193' do
    expect(digital_root(493_193)).to eq(2)
  end
end
