module EngineModule
  def generate_offset(key, date)
    squared_date = (date.to_i ** 2).to_s
    justified_key = key.rjust(5, "0")
    [((justified_key[0] + justified_key[1]).to_i + squared_date[-4].to_i) % 27,
     ((justified_key[1] + justified_key[2]).to_i + squared_date[-3].to_i) % 27,
     ((justified_key[2] + justified_key[3]).to_i + squared_date[-2].to_i) % 27,
     ((justified_key[3] + justified_key[4]).to_i + squared_date[-1].to_i) % 27]
  end
  def character_shuffle(cryption_hash)
    offset_array = cryption_hash[:offset]
    cryption_hash[:message].split('').map.with_index do |character, index|
      if @alphabet.include?(character)
        character_location = @alphabet.find_index(character)
        offset_index = cryption_hash[:crypt] * (offset_array[index % 4])
        @alphabet.rotate(character_location)[offset_index]
      else
        character
      end
    end.join
  end
end
