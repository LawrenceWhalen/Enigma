require './lib/encrypt_engine'
require './lib/decrypt_engine'
require './lib/crack_engine'

class Enigma
  def initialize
  end

  def encrypt(message, key = Enigma.generate_key, date = Time.now.strftime('%d%m%y'))

    Security.check_input(message: message, key: key, date: date)
    encryption = EncryptEngine.new
    encryption.new_encryption(message_pass: message, key_pass: key, date_pass: date)
  end
  def decrypt(message, key, date = Time.now.strftime('%d%m%y'))

    Security.check_input(message: message, key: key, date: date)
    decryption = DecryptEngine.new
    decryption.new_decryption(encryption_pass: message, key_pass: key, date_pass: date)
  end
  def crack(message, date = Time.now.strftime('%d%m%y'))

    Security.check_input(message: message, date: date, key: '12345')
    crack = CrackEngine.new
    crack.new_crack(message_pass: message, date_pass: date)
  end
  def self.generate_key
    random_key = []
    5.times do
      random_key.push((0..9).to_a.sample)
    end
    random_key.join
  end
end
