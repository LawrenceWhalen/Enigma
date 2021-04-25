class Decrypt
  def initialize
    @alphabet = ('a'..'z').to_a << ' '
  end

  def new_decryption(decryption_hash)
    offset = generate_offset(decryption_hash[:key_pass], decryption_hash[:date_pass])
    decrypted_message =  letter_decryption(offset: offset,
                                           encryption: decryption_hash[:encryption_pass].downcase)

   {decryption: decrypted_message,
    key: decryption_hash[:key_pass],
    date: decryption_hash[:date_pass]}
  end

  def generate_offset(key, offset)
    squared_offset = (offset.to_i ** 2).to_s
    justified_key = key.rjust(5, "0")
    {0 => ((justified_key[0] + justified_key[1]).to_i + offset[-4].to_i) % 28,
     1 => ((justified_key[1] + justified_key[2]).to_i + offset[-3].to_i) % 28,
     2 => ((justified_key[2] + justified_key[3]).to_i + offset[-2].to_i) % 28,
     3 => ((justified_key[3] + justified_key[4]).to_i + offset[-1].to_i) % 28}
  end

  def letter_decryption(decryption_hash)
    offset_hash = decryption_hash[:offset]
    offset_loop = 3
    character_array = []
    decryption_hash[:encryption].split('').map do |character|
      if @alphabet.include?(character)
        character_location = @alphabet.find_index(character)
        offset_loop += 1
        final = @alphabet.rotate(character_location)[-(offset_hash[offset_loop % 4])]
        character_array.push(final)
      else
        character_array.push(character)
      end
    end
    character_array.join
  end
end
