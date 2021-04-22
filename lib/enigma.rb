class Enigma
  def initialize
  end

  def self.encrypt(message, key, date)
    Encrypt.new_encryption(message: message, key: key, date: date)
  end
end
