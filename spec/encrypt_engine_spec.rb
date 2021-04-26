require './lib/encrypt_engine'

RSpec.describe 'EncryptEngine' do
  describe '#initialize' do
    it 'creates an instance of Encrypt' do
      encrypt = EncryptEngine.new

      expect(encrypt.class).to eq(EncryptEngine)
    end
    it 'creates an alphabet instance variable' do
      encrypt = EncryptEngine.new

      expected = ('a'..'z').to_a << ' '
      actual = (encrypt).instance_variable_get(:@alphabet)

      expect(actual).to eq(expected)
    end
  end
  describe '#new_encryption' do
    it 'returns a hash of with the encrypted string' do
      encrypt = EncryptEngine.new
      encrypted_hash = encrypt.new_encryption(message_pass: 'Hello World',
                                              key_pass: '02715',
                                              date_pass: '040895')

      expect(encrypted_hash.class).to eq(Hash)
      expect(encrypted_hash[:encryption]).to eq('jlieqgthtsa')
    end
  end
  describe '#generate_offset' do
    it 'creates an offest for encryption' do
      encrypt = EncryptEngine.new

      expected = [2, 7, 24, 20]

      expect(encrypt.generate_offset('02715', '040895')).to eq(expected)
    end
  end
  describe '#character_shuffle' do
    it 'uses an offset to displace letters in a message' do
      encrypt = EncryptEngine.new
      actual_encryption = encrypt.character_shuffle(message: 'hello world',
                                                    offset: {0 => 2, 1 => 7, 2 => 24, 3 => 20},
                                                    crypt: 1)

      expect(actual_encryption.class).to eq(String)
      expect(actual_encryption).to eq('jlieqgthtsa')
    end
    it 'does not encrypt characters not present in @alphabet' do
      encrypt = EncryptEngine.new
      actual_encryption = encrypt.character_shuffle(message: '/?+=@#',
                                                    offset: {0 => 2, 1 => 7, 2 => 24, 3 => 20},
                                                    crypt: 1)

      expect(actual_encryption.class).to eq(String)
      expect(actual_encryption).to eq('/?+=@#')
    end
  end
end
