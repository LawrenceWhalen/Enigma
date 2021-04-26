require 'date'
require './lib/engine_module'

class EncryptEngine
  include EngineModule
  def initialize
    @alphabet = ('a'..'z').to_a << ' '
  end

  def new_encryption(encryption_hash)
    offset = generate_offset(encryption_hash[:key_pass], encryption_hash[:date_pass])

    encrypted_message =  character_shuffle(offset: offset,
                                             message: encryption_hash[:message_pass].downcase,
                                             crypt: 1)
    {encryption: encrypted_message,
     key: encryption_hash[:key_pass],
     date: encryption_hash[:date_pass]}
  end
  
  def self.generate_key
    random_key = []
    5.times do
      random_key.push((0..9).to_a.sample)
    end
    random_key.join
  end
end
