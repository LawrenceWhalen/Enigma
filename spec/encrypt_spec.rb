require './lib/encrypt'

RSpec.describe 'Encrypt' do
  describe '#new' do
    it 'creates an instance of Encrypt' do
      encrypt = Encrypt.new

      expect(encrypt.class).to eq(Encrypt)
    end
  end
end
