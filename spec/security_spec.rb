require './lib/security'

RSpec.describe 'Security' do
  describe '#new' do
    it 'creates an instance of security' do
      security = Security.new

      expect(security.class).to eq(Security)
    end
  end
  describe '#check_input' do
    it 'calls on the three methods to check the input' do
      expect(Security).to receive(:message_check).with('Tim')
      # expect(Security).to receive(:key_check).with('90341')
      # expect(Security).to receive(:date_check).with('240185')

      Security.check_input(message: 'Tim',offset: '90341',date: '240185')
    end
  end
  describe '#message_check' do
    it 'ensures that the passed message is a string' do
      actual = Security.message_check('Time Seen')

      expect(actual).to eq(true)
    end
    it 'exits if the passed parameter is not a string' do

      expect{Security.message_check(90909)}.to raise_error(SystemExit)

    end
  end
  describe '#offset_check' do
    it 'ensures that the offset passed falls within basic parameters' do
      actual = Security.offset_check('09090')

      expect(actual).to eq(true)
    end
  end
end
