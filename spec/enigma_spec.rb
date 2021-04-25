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
      Encrypt.any_instance.stub(:new_encryption).and_return(:"three arguments recieved")

      expect(Enigma.encrypt('Hello World!', '9')).to eq(:"three arguments recieved")
    end
    it 'creates a date if none is provided' do
      Encrypt.any_instance.stub(:new_encryption).with(:date_pass => Time.now.strftime('%d%m%y'),
                                                      :key_pass => '01234',
                                                      :message_pass => 'tim')

      Enigma.encrypt('tim', '01234')
    end
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
  describe 'decrypt' do
    it 'creates a decrypt instance' do
      Enigma.decrypt('message', 'key', 'date')

      expect(Enigma.instance_variable_get(:@decrypt.class)).to eq(Decrypt)
    end
  end
end
