require './lib/engine_module'

RSpec.describe 'EngineModule' do
  describe '#generate_offset' do
    let(:mock_class) { Class.new { extend EngineModule } }

    it 'returns an array containing the offsets for encoding or decoding' do
      expected = [2, 7, 24, 20]

      expect(mock_class.generate_offset('02715', '040895')).to eq(expected)
    end
  end
  describe '#character_shuffle' do
    let(:mock_class) { Class.new { extend EngineModule } }

    it 'takes a hash and encrypts a sting if passed 1' do
      mock_class.instance_variable_set(:@alphabet, ('a'..'z').to_a << ' ')
      actual_encryption = mock_class.character_shuffle(message: 'hello world',
                                                       offset: {0 => 2, 1 => 7, 2 => 24, 3 => 20},
                                                       crypt: 1)

      expect(actual_encryption.class).to eq(String)
      expect(actual_encryption).to eq('jlieqgthtsa')
    end
    it 'takes a hash and decrypts a sting if passed -1' do
      mock_class.instance_variable_set(:@alphabet, ('a'..'z').to_a << ' ')
      actual_encryption = mock_class.character_shuffle(message: 'jlieqgthtsa',
                                                       offset: {0 => 2, 1 => 7, 2 => 24, 3 => 20},
                                                       crypt: -1)

      expect(actual_encryption.class).to eq(String)
      expect(actual_encryption).to eq('hello world')
    end
  end
end
