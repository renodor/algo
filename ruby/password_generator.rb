def password_generator
  downcase_letters   = [*'a'..'z']
  upcase_letters     = downcase_letters.map(&:upcase)
  numbers            = [*'0'..'9']
  special_characters = [*'!'..'/', *':'..'?']
  choices            = [downcase_letters, upcase_letters, numbers, special_characters]

  # put at least 1 downcase letter, 1 upcase letter
  # 1 number & 1 special character in password
  password = choices

  # then take each time a random element to complete password
  4.times { password << choices[[0, 1, 2, 3].sample].sample }

  password.shuffle.join('')
end

describe '#password_generator' do
  it 'contains 8 characters minimum' do
    expect(password_generator.size >= 8).to be true
  end

  it 'contains at least 1 upcase character' do
    expect(password_generator.match?(/[A-Z]+/)).to be true
  end

  it 'contains at least 1 downcase character' do
    expect(password_generator.match?(/[a-z]+/)).to be true
  end

  it 'contains at least 1 letter' do
    expect(password_generator.match?(/\D+/)).to be true
  end

  it 'contains at least 1 number' do
    expect(password_generator.match?(/\d+/)).to be true
  end

  it 'contains at least 1 special character' do
    expect(password_generator.match?(/[\W+_+]/)).to be true
  end

  it 'returns a random password (1000 times)' do
    password = []
    1000.times { password << password_generator }

    expect(password.uniq.length).to eq(1000)
  end
end
