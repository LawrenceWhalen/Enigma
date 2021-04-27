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

  # def seperate_offset_date(offset, date)
  #   date_offset = (date.to_i ** 2).to_s[-4..-1]
  #   offset.map.with_index do |offset_int, index|
  #     if offset_int.to_i >= date_offset[index].to_i
  #       (offset_int.to_i - date_offset[index].to_i)
  #     else
  #       (offset_int.to_i + 27) - date_offset[index].to_i
  #     end
  #   end
  # end

  def brute_force_key(s_offset, date)
    date_offset = (date.to_i ** 2).to_s[-4..-1]
    s_offset.map.with_index do |offset, index|
      map_possible(offset, date_offset[index])
    end
  end

  def map_possible(single_offset, date_chunk)
    guess_array = []
    calculated = single_offset.to_i
    calculated_min = calculated - 27
    until calculated_min < 0
      guess_min = calculated_min - date_chunk.to_i
      guess_array.push(guess_chunk.to_s.rjust(2, '0')) unless guess_min < 0
      calculated_min -= 27
    end
    until calculated > 109
      guess_max = calculated - date_chunk.to_i
      guess_array.push(guess_max.to_s.rjust(2, '0')) unless guess_max.to_i > 99
      calculated += 27
    end
    guess_array
  end
end
