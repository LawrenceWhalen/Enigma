require './lib/engine_module'

class DecryptEngine
  include EngineModule
  def initialize
    @alphabet = ('a'..'z').to_a << ' '
  end

  def new_decryption(decryption_hash)
    offset = generate_offset(decryption_hash[:key_pass], decryption_hash[:date_pass])
    decrypted_message =  character_shuffle(offset: offset,
                                           message: decryption_hash[:encryption_pass].downcase,
                                           crypt: -1)

   {decryption: decrypted_message,
    key: decryption_hash[:key_pass],
    date: decryption_hash[:date_pass]}
  end
end
