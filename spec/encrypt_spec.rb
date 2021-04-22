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
      encrypted_hash = Encrypt.new_encryption(message: 'Hello World',
                                              key: '02715',
                                              date: '040895')

      expect(encrypted_hash.class).to eq(Hash)
    end
  end
  describe '#generate_offset' do
    it 'creates an offest for encryption' do
      encrypt = Encrypt.new

      expect(encrypt.generate_offset).to eq(a: 1, b: 2, c: 3, d: 4)
    end
  end
end
