# frozen_string_literal: true

require 'rspec'

# problem: https://leetcode.com/problems/longest-substring-without-repeating-characters/

def length_of_longest_substring(string)
  result = sub_string_size = 0
  hash = {}
  string.chars.each_with_index do |letter, i|
    # check if this letter is repeted in the string (by checking our hash)
    if hash[letter]
      # if this letter (we will call it X) is repeated, there is two options:

      # 1. there are other repeated letters between the two X
      # so the repetition of X is actually not an issue
      # because we already cut the count when we saw this other repeated letter
      # so we just add one to our sub_string_size += 1

      # 2. there are no other repeated letters between the two X
      # in that case, we have to start to count again from the first X
      # (in order not to loose any eventual letters between both X)
      # so we have to count from the current position - index of the first X
      # so sub_string_size = i - (index of the first X)

      # How do we know we are in situation 1 or 2?
      # If we are in situation 1, the first X is necessarily before the last cut
      # so sub_string_size is < (i - hash[letter])

      # In situation 2, the first X is included within the current sub_string
      # so (i - hash[letter]) <= current_string_size

      # So in any case, we have to take the smallest value among the two

      sub_string_size = [i - hash[letter], sub_string_size + 1].min
    else
      # if the letter is not repeated, our sub_string has 1 more character
      sub_string_size += 1
    end

    # Put every letter in our hash to check repetitions
    # Assign its its index as value to save it
    hash[letter] = i

    # If the current sub_string_size is greater than the previous one,
    # keep it as the (temporal) result
    result = sub_string_size if sub_string_size > result
  end
  result
end

describe 'length of longest substring' do
  it 'give 5 for abcdbef' do
    expect(length_of_longest_substring('abcdbef')).to eq(5)
  end

  it 'give 3 for abcabcbb' do
    expect(length_of_longest_substring('abcabcbb')).to eq(3)
  end

  it 'give 1 for bbbbb' do
    expect(length_of_longest_substring('bbbbb')).to eq(1)
  end

  it 'give 3 for pwwkew' do
    expect(length_of_longest_substring('pwwkew')).to eq(3)
  end

  it 'give 2 for aab' do
    expect(length_of_longest_substring('aab')).to eq(2)
  end

  it 'give 2 for abba' do
    expect(length_of_longest_substring('abba')).to eq(2)
  end

  it 'give 5 for adevdfi' do
    expect(length_of_longest_substring('adevdfi')).to eq(5)
  end

  it 'give 5 for tmmzuxt' do
    expect(length_of_longest_substring('tmmzuxt')).to eq(5)
  end
end
