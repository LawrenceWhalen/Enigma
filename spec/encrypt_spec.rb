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
      encrypt = Encrypt.new
      actual = encrypt.generate_key

      expect(actual.length).to eq(5)
      expect(actual.class).to eq(Array)
    end
  end
end
