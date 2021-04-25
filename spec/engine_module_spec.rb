require './lib/engine_module'

RSpec.describe 'EngineModule' do
  describe '#generate_offset' do
    let(:mock_class) { Class.new { extend EngineModule } }

    it 'returns a hash containing the offsets for encoding or decoding' do
      expected = {0 => 2, 1 => 7, 2 => 24, 3 => 20}

      expect(mock_class.generate_offset('02715', '040895')).to eq(expected)
    end
  end
end
