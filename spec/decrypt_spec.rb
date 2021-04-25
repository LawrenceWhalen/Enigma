require './lib/decrypt'

RSpec.describe 'Decrypt' do
  describe '#new' do
    it 'creates an instance of Decrypt' do
      decrypt = Decrypt.new

      expect(decrypt.class).to eq(Decrypt)
    end
    it 'creates an alphabet instance variable' do
      decrypt = Decrypt.new

      expected = ('a'..'z').to_a << ' '
      actual = (decrypt).instance_variable_get(:@alphabet)

      expect(actual).to eq(expected)
    end
  end
  describe '#new_decryption' do
    it 'returns a hash of with the decrypted string' do
      decrypt = Decrypt.new
      decrypted_hash = decrypt.new_decryption(encryption_pass: 'jlieqgthtsa',
                                              key_pass: '02715',
                                              date_pass: '040895')

      expect(decrypted_hash.class).to eq(Hash)
      expect(decrypted_hash[:decryption]).to eq('hello world')
    end
  end
  describe '#generate_offset' do
    it 'creates an offest for decryption' do
      decrypt = Decrypt.new

      expected = {0 => 2, 1 => 7, 2 => 24, 3 => 20}

      expect(decrypt.generate_offset('02715', '040895')).to eq(expected)
    end
  end
  describe '#letter_decryption' do
    it 'uses an offset to decrypt characters in a message' do
      decrypt = Decrypt.new
      actual_decryption = decrypt.letter_decryption(encryption: 'jlieqgthtsa',
                                              offset: {0 => 2, 1 => 7, 2 => 24, 3 => 20})

      expect(actual_decryption.class).to eq(String)
      expect(actual_decryption).to eq('hello world')
    end
  end
end
