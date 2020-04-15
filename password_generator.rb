def password_generator
  downcase_letters = [*'a'..'z']
  upcase_letters = [*'A'..'Z']
  numbers = [*'0'..'9']
  special_characters = [*'!'..'/', *':'..'?']
  choice = [downcase_letters, upcase_letters, numbers, special_characters]
  password = []
  j = 0
  # put at least 1 downcase letter, 1 upcase letter
  # 1 number & 1 special character in password
  4.times do
    password << choice[j].sample
    j += 1
  end

  # then take each time a random element to complete password
  4.times do
    password << choice[(0..3).to_a.sample].sample
  end
  password.shuffle.join('')
end

describe '#password_generator' do
  it 'contain 8 characters minimum' do
    expect(password_generator.size >= 8).to be true
  end

  it 'contain at least 1 upcase character' do
    expect(password_generator.match?(/[A-Z]+/)).to be true
  end

  it 'contain at least 1 downcase character' do
    expect(password_generator.match?(/[a-z]+/)).to be true
  end

  it 'contain at least 1 letter' do
    expect(password_generator.match?(/\D+/)).to be true
  end

  it 'contain at least 1 number' do
    expect(password_generator.match?(/\d+/)).to be true
  end

  it 'contain at least 1 special character' do
    expect(password_generator.match?(/[\W+\_+]/)).to be true
  end

  it 'return a random password (100 times)' do
    def password_generator_random_test
      save = password_generator
      100.times do
        return false if password_generator == save
      end
      true
    end

    expect(password_generator_random_test).to be true
  end
end
