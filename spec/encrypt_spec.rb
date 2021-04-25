require './lib/encrypt'

RSpec.describe 'Encrypt' do
  describe '#initialize' do
    it 'creates an instance of Encrypt' do
      encrypt = Encrypt.new

      expect(encrypt.class).to eq(Encrypt)
    end
  end
  describe '#new_encryption' do
    it 'returns a hash of with the encrypted string' do
      encrypt = Encrypt.new
      encrypted_hash = encrypt.new_encryption(message_pass: 'Hello World',
                                              key_pass: '02715',
                                              date_pass: '040895')

      expect(encrypted_hash.class).to eq(Hash)
      expect(encrypted_hash[:encryption]).to eq('jlieqgthtsa')
    end
  end
  describe '#generate_offset' do
    it 'creates an offest for encryption' do
      encrypt = Encrypt.new

      expected = {0 => 2, 1 => 7, 2 => 24, 3 => 20}

      expect(encrypt.generate_offset('02715', '040895')).to eq(expected)
    end
  end
  describe '#generate_key' do
    it 'creates a key for encryption' do
      actual = Encrypt.generate_key

      expect(actual.length).to eq(5)
      expect(actual.class).to eq(String)
    end
  end
  describe '#letter_substitution' do
    it 'uses an offset to displace letters in a message' do
      encrypt = Encrypt.new
      actual_encryption = encrypt.letter_substitution(message: 'hello world',
                                              offset: {0 => 2, 1 => 7, 2 => 24, 3 => 20})

      expect(actual_encryption.class).to eq(String)
      expect(actual_encryption).to eq('jlieqgthtsa')
    end
    it 'does not encrypt characters not present in @alphabet' do
      encrypt = Encrypt.new
      actual_encryption = encrypt.letter_substitution(message: '/?+=@#',
                                              offset: {0 => 2, 1 => 7, 2 => 24, 3 => 20})

      expect(actual_encryption.class).to eq(String)
      expect(actual_encryption).to eq('/?+=@#')
    end
  end
end
