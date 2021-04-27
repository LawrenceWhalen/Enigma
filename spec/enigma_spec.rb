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
      allow_any_instance_of(EncryptEngine).to receive(:new_encryption).with(:key_pass => '01234',
                                                                            :message_pass => 'tim',
                                                                            :date_pass => '040895')

      enigma = Enigma.new
      enigma.encrypt('tim', '01234', '040895')
    end
    it 'creates a date if none is provided' do
      allow_any_instance_of(EncryptEngine).to receive(:new_encryption).with(:date_pass => Time.now.strftime('%d%m%y'),
                                                                            :key_pass => '01234',
                                                                            :message_pass => 'tim')

      enigma = Enigma.new
      enigma.encrypt('tim', '01234')
    end
    it 'creates a key and a date if none are provided' do
      allow(Enigma).to receive(:generate_key).and_return('99999')
      allow_any_instance_of(EncryptEngine).to receive(:new_encryption).with(:date_pass => Time.now.strftime('%d%m%y'),
                                                                            :key_pass => '99999',
                                                                            :message_pass => 'tim')

      enigma = Enigma.new
      enigma.encrypt('tim')
    end
    it 'calls a security check passing all parameters' do
      allow(Security).to receive(:check_input).with(:message => 'tim',
                                                    :key => '01234',
                                                    :date => '040895')

      enigma = Enigma.new
      enigma.encrypt('tim', '01234', '040895')
    end
  end
  describe '#decrypt' do
    it 'calls a security check passing all parameters' do
      allow(Security).to receive(:check_input).with(:message => 'tim',
                                                    :key => '01234',
                                                    :date => '040895')

      enigma = Enigma.new
      enigma.decrypt('tim', '01234', '040895')
    end
    it 'creates a decrypt instance and passes three arguments' do
      allow_any_instance_of(DecryptEngine).to receive(:new_decryption).with(:key_pass => '01234',
                                                                            :encryption_pass => 'tim',
                                                                            :date_pass => '040895')

      enigma = Enigma.new
      enigma.decrypt('tim', '01234', '040895')
    end
    it 'creates a decrypt instance and creates a date if none is passed' do
      allow_any_instance_of(DecryptEngine).to receive(:new_decryption).with(:key_pass => '01234',
                                                                            :encryption_pass => 'tim',
                                                                            :date_pass => Time.now.strftime('%d%m%y'))

      enigma = Enigma.new
      enigma.decrypt('tim', '01234')
    end
  end
  describe '#crack' do
    it 'calls the crack class passing the arguments' do
      allow_any_instance_of(CrackEngine).to receive(:new_crack).with(:message_pass => 'tim',
                                                                     :date_pass => '040895')

      enigma = Enigma.new
      enigma.crack('tim', '040895')
    end
    it 'creates a date if none is provided' do
      allow_any_instance_of(CrackEngine).to receive(:new_crack).with(:message_pass => 'tim',
                                                                     :date_pass => Time.now.strftime('%d%m%y'))

      enigma = Enigma.new
      enigma.crack('tim')
    end
  end
  describe '#generate_key' do
    it 'creates a key for encryption' do
      actual = Enigma.generate_key

      expect(actual.length).to eq(5)
      expect(actual.class).to eq(String)
    end
  end
end
