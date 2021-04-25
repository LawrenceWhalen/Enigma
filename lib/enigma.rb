require './lib/encrypt_engine'
require './lib/decrypt_engine'

class Enigma
  def initialize
  end

  def self.encrypt(message,
                   key = EncryptEngine.generate_key,
                   date = Time.now.strftime('%d%m%y'))


    @encryption = EncryptEngine.new
    @encryption.new_encryption(message_pass: message, key_pass: key, date_pass: date)
  end
  def self.decrypt(message,
                   key,
                   date = Time.now.strftime('%d%m%y'))

    @decryption = DecryptEngine.new
    @decryption.new_decryption(encryption_pass: message, key_pass: key, date_pass: date)
  end
end
