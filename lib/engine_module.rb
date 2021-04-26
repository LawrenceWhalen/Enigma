module EngineModule
  def generate_offset(key, offset)
    squared_offset = (offset.to_i ** 2).to_s
    justified_key = key.rjust(5, "0")
    {0 => ((justified_key[0] + justified_key[1]).to_i + offset[-4].to_i) % 28,
     1 => ((justified_key[1] + justified_key[2]).to_i + offset[-3].to_i) % 28,
     2 => ((justified_key[2] + justified_key[3]).to_i + offset[-2].to_i) % 28,
     3 => ((justified_key[3] + justified_key[4]).to_i + offset[-1].to_i) % 28}
  end
  def character_shuffle(cryption_hash)
    offset_hash = cryption_hash[:offset]
    offset_loop = 3
    character_array = []
    cryption_hash[:message].split('').map do |character|
      if @alphabet.include?(character)
        character_location = @alphabet.find_index(character)
        offset_loop += 1
        offset_index = cryption_hash[:crypt] * (offset_hash[offset_loop % 4])
        final = @alphabet.rotate(character_location)[offset_index]
        character_array.push(final)
      else
        character_array.push(character)
      end
    end
    character_array.join
  end
end
