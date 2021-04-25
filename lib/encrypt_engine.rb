require 'date'

class EncryptEngine
  def initialize
    @alphabet = ('a'..'z').to_a << ' '
  end

  def new_encryption(encryption_hash)
    offset = generate_offset(encryption_hash[:key_pass], encryption_hash[:date_pass])

    encrypted_message =  letter_substitution(offset: offset,
                                             message: encryption_hash[:message_pass].downcase)
    {encryption: encrypted_message,
     key: encryption_hash[:key_pass],
     date: encryption_hash[:date_pass]}
  end

  def letter_substitution(substitution_hash)
    offset_hash = substitution_hash[:offset]
    offset_loop = 3
    character_array = []
    substitution_hash[:message].split('').map do |character|

      if @alphabet.include?(character)
        character_location = @alphabet.find_index(character)
        offset_loop += 1
        final = @alphabet.rotate(character_location)[offset_hash[offset_loop % 4]]
        character_array.push(final)
      else
        character_array.push(character)
      end
    end
    character_array.join
  end

  def generate_offset(key, offset)
    squared_offset = (offset.to_i ** 2).to_s
    justified_key = key.rjust(5, "0")
    {0 => ((justified_key[0] + justified_key[1]).to_i + offset[-4].to_i) % 28,
     1 => ((justified_key[1] + justified_key[2]).to_i + offset[-3].to_i) % 28,
     2 => ((justified_key[2] + justified_key[3]).to_i + offset[-2].to_i) % 28,
     3 => ((justified_key[3] + justified_key[4]).to_i + offset[-1].to_i) % 28}
  end

  def self.generate_key
    random_key = []
    5.times do
      random_key.push((0..9).to_a.sample)
    end
    random_key.join
  end
end
