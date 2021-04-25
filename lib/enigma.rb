require './lib/encrypt'

class Enigma
  def initialize
  end

  def self.encrypt(message,
                   key = Encrypt.generate_key,
                   date = Time.now.strftime('%d%m%y').to_i)

    @encryption = Encrypt.new
    @encryption.new_encryption(message_pass: message, key_pass: key, date_pass: date)
  end
end
