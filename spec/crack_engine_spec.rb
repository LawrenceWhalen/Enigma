require './lib/crack_engine'

RSpec.describe CrackEngine do
  describe '#new' do
    it 'creates an instance of a CrackEngine' do
      crack = CrackEngine.new

      expect(crack.class).to eq(CrackEngine)
    end
  end
  describe '#new_crack' do
    it 'returns cracked message' do
      crack = CrackEngine.new
      cracked_hash = crack.new_crack(message_pass: 'jlieqgthtsa',
                                     date: '040895')

      expect(cracked_hash.class).to eq(Hash)
      expect(cracked_hash[:message]).to eq('Hello World')
    end
    it 'returns the key to decode the message' do
      crack = CrackEngine.new
      cracked_hash = crack.new_crack(message_pass: 'jlieqgthtsa',
                                     date: '040895')

      decrypt_test = Enigma.decrypt('jlieqgthtsa', cracked_hash[:key], '040895')

      expect(decrypt_test[:decryption]).to eq('Hello World')
    end
  end
  describe '#offset_decode' do
    it 'takes a message chunck to decode the offset' do
      crack = CrackEngine.new
      cracked_offset = crack.offset_decode(27, 'f pf', '260421')

      expect(cracked_offset).to eq([22, 2, 2, 6])
    end
  end
end
# ' end'
# 'f pf'
# 78289 and date 260421
