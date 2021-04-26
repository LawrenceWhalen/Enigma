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
      allow(Security).to receive(:messsage_check).and_return('Tim')
      allow(Security).to receive(:offset_check).and_return('90341')
      allow(Security).to receive(:messsage_check).and_return('240185')

      actual = Security.check_input('Tim', '90341', '240185')

      expect(actual).to eq(message: 'Tim', key: '90341', date: '240185')
    end
  end
end
