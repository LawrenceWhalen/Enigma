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
      expect(Security).to receive(:key_check).with('90341')
      # expect(Security).to receive(:date_check).with('240185')

      Security.check_input(message: 'Tim',key: '90341',date: '240185')
    end
  end
  describe '#message_check' do
    it 'ensures that the passed message is a string' do
      actual = Security.message_check('Time Seen')

      expect(actual).to eq(true)
    end
    it 'exits if the passed parameter is not a string' do
      expect {
        begin Security.message_check(90909)
        rescue SystemExit
        end
      }.to output('Your message cannot be translated!').to_stdout
    end
  end
  describe '#key_check' do
    it 'ensures that the key passed falls within basic parameters' do
      actual = Security.key_check('01010')

      expect(actual).to eq(true)
    end
    it 'exits if the passed key is not a string' do
      expect {
        begin Security.key_check(90909)
        rescue SystemExit
        end
      }.to output('The key is passed incorrectly!').to_stdout
    end
    it 'exits if the passed key is not a set of numbers' do
      expect {
        begin Security.key_check('P0909')
        rescue SystemExit
        end
      }.to output('The key is not a number!').to_stdout
    end
    it 'exits if the passed key is too long' do
      expect {
        begin Security.key_check('909099')
        rescue SystemExit
        end
      }.to output('The key is too long!').to_stdout
    end
  end
  describe '#date_check' do
    it 'ensures the date is correctly formatted' do
      actual = Security.date_check('010121')

      expect(actual).to eq(true)
    end
    it 'exits if the passed date is not a string' do
      expect {
        begin Security.date_check(010121)
        rescue SystemExit
        end
      }.to output('The date was passed incorrectly!').to_stdout
    end
    it 'exits if the passed date is not a number' do
      expect {
        begin Security.date_check('01012p')
        rescue SystemExit
        end
      }.to output('The date includes excluded characters.').to_stdout
    end
    it 'exits if the passed date is too long' do
      expect {
        begin Security.date_check('0101222')
        rescue SystemExit
        end
      }.to output('The date is improperly formatted.').to_stdout
    end
    it 'exits if the date is incorrectly formatted' do
      expect {
        begin Security.date_check('123122')
        rescue SystemExit
        end
      }.to output('The date is improperly formatted, or a bad date.').to_stdout
    end
    it 'exits if the date is impossible' do
      expect {
        begin Security.date_check('341222')
        rescue SystemExit
        end
      }.to output('The date is improperly formatted, or a bad date.').to_stdout
    end
  end
end
