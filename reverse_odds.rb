require 'rspec'
# Write a ruby method that reverses the odd-indexed characters of a string in place (without making a copy). Do not use the built-in reverse methods or similar (write the code to move the characters yourself). Sample output:

def reverse_odds(string)
  result = arr = string.chars
  arr.each_with_index do |letter, i|
    if i.odd?
      result[i] = arr[- 1 - i]
      result[-1 - i] = letter
    else
      letter
    end
    return result.join('') if i >= (arr.length / 2)
  end
end

describe 'reverse_odds' do
  it "return 'hlloo wlred' for 'hello world' " do
    expect(reverse_odds('hello world')).to eq('hlloo wlred')
  end

  it "return 'hello world' for 'hello world!' " do
    expect(reverse_odds('hello world!')).to eq('hdlrow olle!')
  end
end
