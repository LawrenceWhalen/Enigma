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

      Enigma.encrypt('tim', '01234', '040895')
    end
    it 'creates a date if none is provided' do
      allow_any_instance_of(EncryptEngine).to receive(:new_encryption).with(:date_pass => Time.now.strftime('%d%m%y'),
                                                      :key_pass => '01234',
                                                      :message_pass => 'tim')

      Enigma.encrypt('tim', '01234')
    end
    it 'creates a key and a date if none are provided' do
      allow(EncryptEngine).to receive(:generate_key).and_return('99999')
      allow_any_instance_of(EncryptEngine).to receive(:new_encryption).with(:date_pass => Time.now.strftime('%d%m%y'),
                                                      :key_pass => '99999',
                                                      :message_pass => 'tim')

      Enigma.encrypt('tim')
    end
  end
  describe '#decrypt' do
    it 'creates a decrypt instance and passes three arguments' do
      allow_any_instance_of(DecryptEngine).to receive(:new_decryption).with(:key_pass => '01234',
                                                      :encryption_pass => 'tim',
                                                      :date_pass => '040895')

      Enigma.decrypt('tim', '01234', '040895')
    end
    it 'creates a decrypt instance and creates a date if none is passed' do
      allow_any_instance_of(DecryptEngine).to receive(:new_decryption).with(:key_pass => '01234',
                                                      :encryption_pass => 'tim',
                                                      :date_pass => Time.now.strftime('%d%m%y'))

      Enigma.decrypt('tim', '01234')
    end
  end
end
