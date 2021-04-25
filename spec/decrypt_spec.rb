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
      decrypted_hash = decrypt.new_decryption(message_pass: 'jlieqgthtsa',
                                              key_pass: '02715',
                                              date_pass: '040895')

      expect(decrypted_hash.class).to eq(Hash)
      expect(decrypted_hash[:decryption]).to eq('Hello World')
    end
  end
end
