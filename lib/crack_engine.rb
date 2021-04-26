require './lib/engine_module'

class CrackEngine
  include EngineModule

  def initialize
    @alphabet_array = [(('a'..'z').to_a << ' ').rotate!(26),
                       (('a'..'z').to_a << ' ').rotate!(4),
                       (('a'..'z').to_a << ' ').rotate!(13),
                       (('a'..'z').to_a << ' ').rotate!(3)]
  end

  def new_crack(crack_hash)
    crack_hash[:message_pass]
    crack_hash[:date_pass]

    {decryption: decrypted_message,
     key: '',
     date: crack_hash[:date_pass]}
  end

  def offset_decode(message_length, last_four, date)
    offset_start = message_length % 4
    unshifted_offset = last_four.split('').map.with_index do |character, index|
      @alphabet_array[index].find_index(character).to_s
    end
    test = unshifted_offset.rotate(-1 * offset_start)
  end
end
