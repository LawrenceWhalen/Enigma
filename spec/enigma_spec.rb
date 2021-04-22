require './lib/enigma'

RSpec.describe 'Enigma' do
  describe '#initialize' do
    it 'creates an instance of Enigma class' do
      enigma = Enigma.new

      expect(enigma.class).to eq(Enigma)
    end
  end
  describe '#encrypt' do
    it 'calls the encrypt class passing the arguments' do
      Enigma.encrypt('Hello World', '02715', '040895')

      expect(Encrypt).to receive(:encrypt_string).with(@encrypt_hash)
    end
  end
end
