require './lib/engine_module'

class CrackEngine
  include EngineModule

  def initialize
    @alphabet_array = [(('a'..'z').to_a << ' ').rotate!(26),
                       (('a'..'z').to_a << ' ').rotate!(4),
                       (('a'..'z').to_a << ' ').rotate!(13),
                       (('a'..'z').to_a << ' ').rotate!(3)]

    @alphabet = ('a'..'z').to_a << ' '
  end

  def new_crack(crack_hash)
    crack_hash[:message_pass]
    crack_hash[:date_pass]

    {decryption: decrypted_message,
     key: '',
     date: crack_hash[:date_pass]}
  end

  def offset_decode(message_length, last_four)
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
        (offset_int.to_i + 27) - date_offset[index].to_i
      end
    end
  end

  def brute_force_key(s_offset)
    test = s_offset.map do |offset|
      map_possible(offset)
    end

  end

  def map_possible(start)
    guess_array = []
    calculated = start
    until calculated > 100
      guess_array.push(calculated.to_s.rjust(2, '0'))
      calculated += 28
    end
    guess_array
  end
end
