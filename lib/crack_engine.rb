require './lib/engine_module'

class CrackEngine
  include EngineModule

  def new_crack(crack_hash)
    crack_hash[:message_pass]
    crack_hash[:date_pass]

    {decryption: decrypted_message,
     key: '',
     date: crack_hash[:date_pass]}
  end

end
