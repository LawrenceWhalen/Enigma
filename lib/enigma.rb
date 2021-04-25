require './lib/encrypt'
require './lib/decrypt'

class Enigma
  def initialize
  end

  def self.encrypt(message,
                   key = Encrypt.generate_key,
<<<<<<< HEAD
                   date = Time.now.strftime('%d%m%y').to_i ** 2)
=======
                   date = Time.now.strftime('%d%m%y'))
>>>>>>> 482ac58d91fa47f8f36bda2b08c374c94119c22f

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
