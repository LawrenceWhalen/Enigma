require './lib/decrypt_engine'

RSpec.describe 'Decrypt_engine' do
  describe '#new' do
    it 'creates an instance of Decrypt' do
      decrypt = DecryptEngine.new

      expect(decrypt.class).to eq(DecryptEngine)
    end
    it 'creates an alphabet instance variable' do
      decrypt = DecryptEngine.new

      expected = ('a'..'z').to_a << ' '
      actual = (decrypt).instance_variable_get(:@alphabet)

      expect(actual).to eq(expected)
    end
  end
  describe '#new_decryption' do
    it 'returns a hash of with the decrypted string' do
      decrypt = DecryptEngine.new
      decrypted_hash = decrypt.new_decryption(encryption_pass: 'jlieqgthtsa',
                                              key_pass: '02715',
                                              date_pass: '040895')

      expect(decrypted_hash.class).to eq(Hash)
      expect(decrypted_hash[:decryption]).to eq('hello world')
    end
  end
  describe '#generate_offset' do
    it 'creates an offest for decryption' do
      decrypt = DecryptEngine.new

      expected = [2, 7, 24, 20]

      expect(decrypt.generate_offset('02715', '040895')).to eq(expected)
    end
  end
  describe '#character_shuffle' do
    it 'uses an offset to decrypt characters in a message' do
      decrypt = DecryptEngine.new
      actual_decryption = decrypt.character_shuffle(message: 'jlieqgthtsa',
                                              offset: {0 => 2, 1 => 7, 2 => 24, 3 => 20},
                                              crypt: -1)

      expect(actual_decryption.class).to eq(String)
      expect(actual_decryption).to eq('hello world')
    end
    it 'does not decrypt characters not in @alphabet' do
      decrypt = DecryptEngine.new
      actual_decryption = decrypt.character_shuffle(message: '^&%#)()',
                                              offset: {0 => 2, 1 => 7, 2 => 24, 3 => 20},
                                              crypt: -1)

      expect(actual_decryption.class).to eq(String)
      expect(actual_decryption).to eq('^&%#)()')
    end
  end
end
