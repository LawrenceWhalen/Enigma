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
    message = crack_hash[:message_pass].chomp
    date = crack_hash[:date_pass]

    offset = offset_decode(message.length, message[-4..-1])
    decrypted_message = character_shuffle(message: message, offset: offset, crypt: -1)
    key_new = brute_force_key(offset, date)
    key_final = [key_new[0], key_new[2], key_new[3][1]].join

    {decryption: decrypted_message,
     key: key_final,
     date: date}
  end

  def offset_decode(message_length, last_four)
    offset_start = message_length % 4
    unshifted_offset = last_four.split('').map.with_index do |character, index|
      @alphabet_array[index].find_index(character)
    end
    unshifted_offset.rotate(-1 * offset_start)
  end

  def brute_force_key(s_offset, date)
    date_offset = (date.to_i ** 2).to_s[-4..-1]
    all_possible = s_offset.map.with_index do |offset, index|
      map_possible(offset, date_offset[index])
    end
    force_array = []
    all_possible[0].map do |key_one|
      all_possible[1].map do |key_two|
        if key_one[1] == key_two[0]
          force_array.push([key_one, key_two])
        end
      end
    end
    force_array_two = []
    repeat = force_array.length
    repeat.times.with_index do |index_1|
      all_possible[2].map do |key|
        if key[0] == force_array[index_1][1][1]
          force_array_two.push([force_array[index_1][0], force_array[index_1][1], key])
        end
      end
    end
    force_array_three = []
    repeat_2 = force_array_two.length
    repeat_2.times.with_index do |index_1|
      all_possible[3].map.with_index do |key, index_2|
        if key[0] == force_array_two[index_1][2][1]
          force_array_three.push([force_array_two[index_1][0],
                                  force_array_two[index_1][1],
                                  force_array_two[index_1][2],
                                  key])
        end
      end
    end
    force_array_three[0]
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
