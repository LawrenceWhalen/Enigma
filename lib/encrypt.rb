require 'date'

class Encrypt
  def initialize
    @alphabet = ['a'..'z'].to_a << ' '
  end

  def new_encryption(encryption_hash)
    offset = generate_offset(encryption_hash[:key_pass], encryption_hash[:date_pass])
    require "pry"; binding.pry
    encrypted_message =  letter_substitution(offset: offset,
                                             messsage: encryption_hash[:message].downcase)
    puts encrypted_message
  end

  def letter_substitution(substitution_hash)
    offset_hash = substitution_hash[:offset]
    offset_loop = 3
    character_array = substitution_hash[:message].split.map do |character|
      if @alphabet.include?(character)
        character_location = @alphabet.find_index(character)
        offset_loop += 1
        @alphabet.rotate(character_location)[offset_hash[offset_loop % 4]]
      else
        character
      end
    end
  end

  def generate_offset(key, offset)
    squared_offset = offset.to_i ** 2
    justified_key = key.to_i.rjust(5, "0")
    {0 => (justified_key[0, 1] + offset[-4]) % 28,
     1 => (justified_key[1, 2] + offset[-3]) % 28,
     2 => (justified_key[2, 3] + offset[-2]) % 28,
     3 => (justified_key[3, 4] + offset[-1]) % 28}
  end

  def self.generate_key
    test = []
    5.times do
      test.push((0..9).to_a.sample)
    end
    test.join
  end
end
