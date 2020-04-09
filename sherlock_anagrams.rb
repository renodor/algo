# frozen_string_literal: true

require 'rspec'

# problem: https://www.hackerrank.com/challenges/sherlock-and-anagrams/problem

def sherlock_anagrams(string)
  # initialize a hash with 0 as default value
  hash = Hash.new(0)
  count = 0
  # split the string into an array of letters
  arr = string.chars
  arr.each_with_index do |_, i|
    # for each letter, slice the array starting from this letter
    # and iterate over it (to have a finite loop the size of the sliced array)
    arr[i, arr.length].each_with_index do |_, j|
      # first loop will take only the first letter of the sliced array
      # second loop will take the two first letter of the sliced array etc...
      # each time sort the sub sliced array and join it to form an a sub string
      # (it is essential to sort it to spot anagrams
      # like that we have every substring possible from this sliced array
      sub_string = arr[i, j + 1].sort.join('')
      # add every possible sorted substring to the hash
      # counting how many time it appear
      hash[sub_string] += 1
      # if a sub string appear 2 times, we have an anagram
      # if a sub string appear 3 times we have 2 anagrams etc...
      # so we need to count starting from 2 hash[sub_string]
      count += (hash[sub_string] - 1)
    end
  end
  count
end

describe 'sherlock_anagrams' do
  it 'return a number' do
    expect(sherlock_anagrams('abc').class).to eq(Integer)
  end

  it 'return a 4 for abba' do
    expect(sherlock_anagrams('abba')).to eq(4)
  end

  it 'return a 0 for abcd' do
    expect(sherlock_anagrams('abcd')).to eq(0)
  end

  it 'return a 3 for ifailuhkqq' do
    expect(sherlock_anagrams('ifailuhkqq')).to eq(3)
  end

  it 'return a 10 for kkkk' do
    expect(sherlock_anagrams('kkkk')).to eq(10)
  end

  it 'return a 5 for cdcd' do
    expect(sherlock_anagrams('cdcd')).to eq(5)
  end
end
