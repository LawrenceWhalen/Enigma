class Decrypt
  def initialize
    @alphabet = ('a'..'z').to_a << ' '
  end

  def new_decryption(decryption_hash)
    offset = generate_offset(decryption_hash[:key_pass], decryption_hash[:date_pass])

  end

  def generate_offset(key, offset)
    squared_offset = (offset.to_i ** 2).to_s
    justified_key = key.rjust(5, "0")
    {0 => ((justified_key[0] + justified_key[1]).to_i + offset[-4].to_i) % 28,
     1 => ((justified_key[1] + justified_key[2]).to_i + offset[-3].to_i) % 28,
     2 => ((justified_key[2] + justified_key[3]).to_i + offset[-2].to_i) % 28,
     3 => ((justified_key[3] + justified_key[4]).to_i + offset[-1].to_i) % 28}
  end

end
