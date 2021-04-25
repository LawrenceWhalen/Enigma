require './lib/decrypt'

RSpec.describe 'Decrypt' do
  describe '#new' do
    it 'creates an instance of Decrypt' do
      decrypt = Decrypt.new

      expect(decrypt.class).to eq(Decrypt)
    end
  end
end
