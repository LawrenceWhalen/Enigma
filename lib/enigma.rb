require './lib/encrypt'
require './lib/decrypt'

class Enigma
  def initialize
  end

  def self.encrypt(message,
                   key = Encrypt.generate_key,
                   date = Time.now.strftime('%d%m%y'))


    @encryption = Encrypt.new
    @encryption.new_encryption(message_pass: message, key_pass: key, date_pass: date)
  end
  def self.decrypt(message,
                   key,
                   date = Time.now.strftime('%d%m%y'))
    @decryption = Decrypt.new
    @decryption.new_dycryption(message_pass: message, key_pass: key, date_pass: date)
  end
end
