require './lib/decrypt'

RSpec.describe 'Decrypt' do
  describe '#new' do
    it 'creates an instance of Decrypt' do
      decrypt = Decrypt.new

      expect(decrypt.class).to eq(Decrypt)
    end
  end
  describe '#new_decryption' do
    it 'returns a hash of with the decrypted string' do
      decrypt = Decrypt.new
      decrypted_hash = decrypt.new_decryption(message_pass: 'Hello World',
                                              key_pass: '02715',
                                              date_pass: '040895')

      expect(encrypted_hash.class).to eq(Hash)
    end
  end
end
