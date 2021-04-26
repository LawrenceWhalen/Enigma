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

  def seperate_offset_date(offset, date)
    date_offset = (date.to_i ** 2).to_s[-4..-1]
    offset.map.with_index do |offset_int, index|
      if offset_int.to_i >= date_offset[index].to_i
        (offset_int.to_i - date_offset[index].to_i)
      else
        ((date_offset[index].to_i - offset_int.to_i) + 28)
      end
    end
  end
end
