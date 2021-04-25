require './lib/enigma'

RSpec.describe 'Enigma' do
  describe '#initialize' do
    it 'creates an instance of Enigma class' do
      enigma = Enigma.new

      expect(enigma.class).to eq(Enigma)
    end
  end
  describe '#encrypt' do
    it 'calls the encrypt class passing the arguments returning a hash' do
        actual = Enigma.encrypt('Hello World!', '02715', '040895')

        expected = { encryption: 'jlieqgthtsa!',
                     key: '02715',
                     date: '040895'}

        expect(actual).to eq(expected)
    end
    # it 'creates a date if none is provided' do
    #     encryption = double('encrypt')
    #
    #     allow(encryption).to receive(:new_encryption) {"three arguments recieved"}
    #
    #     expect(encryption).to receive(:new_encryption)
    #
    #     Enigma.encrypt('Hello World!', '9', '240121')
    # end
    # it 'creates a date if none is provided' do
    #     encryption = double('encrypt')
    #
    #     allow(encryption).to receive(:new_encryption) {"three arguments recieved"}
    #
    #     expect(encryption).to recieve(:new_encryption)
    #
    #     Enigma.encrypt('Hello World!', '9', '240121')
    # end
  end
end
