require './lib/engine_module'

RSpec.describe 'EngineModule' do
  describe '#generate_offset' do
    let(:mock_class) { Class.new { extend EngineModule } }

    it 'returns a hash containing the offsets for encoding or decoding' do
      expected = {0 => 2, 1 => 7, 2 => 24, 3 => 20}

      expect(mock_class.generate_offset('02715', '040895')).to eq(expected)
    end
  end
  describe '#character_shuffle' do
    let(:mock_class) { Class.new { extend EngineModule } }

    it 'takes a hash and encrypts a sting if passed nil' do
      actual_encryption = mock_class.character_shuffle(message: 'hello world',
                                                       offset: {0 => 2, 1 => 7, 2 => 24, 3 => 20},
                                                       crypt: :+)

      expect(actual_encryption.class).to eq(String)
      expect(actual_encryption).to eq('jlieqgthtsa')
    end
  end
end
