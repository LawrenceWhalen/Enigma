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

      expect(cracked_offset).to eq(['22', '2', '2', '6'])
    end
  end
  describe 'brute_force_key' do
    it 'returns a key when passed a message sample, offset, and date' do
      crack = CrackEngine.new
      offset = ['22', '2', '2', '6']

      actual = crack.brute_force_key('f pf', offset, '260421')
    end
  end
  describe '#seperate_offset_date' do
    it 'returns a modified offset array with date removed' do
      crack = CrackEngine.new
      offset = ['22', '2', '2', '6']

      actual = crack.seperate_offset_date(offset, '260421')

      expect(actual).to eq([15, 0, 30, 5])
    end
  end
end
# ' end'
# 'f pf'
# 78289 and date 260421
