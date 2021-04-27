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
      cracked_hash = crack.new_crack(message_pass: 'qnevxipy uxjbqbbirljbqyjnwx',
                                     date_pass: '260421')

      expect(cracked_hash.class).to eq(Hash)
      expect(cracked_hash[:decryption]).to eq('hello world this is the end')
    end
    it 'returns the key to decode the message' do
      crack = CrackEngine.new
      cracked_hash = crack.new_crack(message_pass: 'qnevxipy uxjbqbbirljbqyjnwx',
                                     date_pass: '260421')

      expect(cracked_hash.class).to eq(Hash)
      expect(cracked_hash[:key]).to eq('56163')
    end
  end
  describe '#offset_decode' do
    it 'takes a message chunck to decode the offset' do
      crack = CrackEngine.new
      cracked_offset = crack.offset_decode(27, 'lbwm')

      expect(cracked_offset).to eq([24, 9, 9, 12])
    end
  end
  describe 'brute_force_key' do
    it 'returns a key when passed a message sample, offset, and date' do
      crack = CrackEngine.new
      offset = ['24', '9', '9', '12']

      actual = crack.brute_force_key(offset, '260421')

      expect(actual).to eq(["98", "88", "86", "65"])
    end
  end
  describe '#map_possible' do
    it 'returns an array of all possible numbers for an offset' do
      crack = CrackEngine.new

      actual = crack.map_possible('24', '7')


      expect(actual).to eq(["17", "44", "71", "98"])
    end
    it 'returns an array of all possible numbers for a large offset' do
      crack = CrackEngine.new

      actual = crack.map_possible('33', '7')


      expect(actual).to eq(["26", "53", "80"])
    end
  end
  describe '#generate_offset' do
    it 'creates an offest for decryption' do
      crack = CrackEngine.new

      expected = [3, 0, 19, 20]

      expect(crack.generate_offset('02715', '040895')).to eq(expected)
    end
  end
  describe '#character_shuffle' do
    it 'uses an offset to decrypt characters in a message' do
      crack = CrackEngine.new
      actual_decryption = crack.character_shuffle(message: 'keder ohulw',
                                              offset: [3, 0, 19, 20],
                                              crypt: -1)

      expect(actual_decryption.class).to eq(String)
      expect(actual_decryption).to eq('hello world')
    end
  end
end
