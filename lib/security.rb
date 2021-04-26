class Security
  def self.check_input(security_hash)
    Security.message_check(security_hash[:message])
    Security.key_check(security_hash[:key])
    # Security.date_check(security_hash[:date])
  end
  def self.message_check(message)
    if message.class != String
      print 'Your message cannot be translated!'
      exit
    end
    true
  end
  def self.key_check(key)
    if key.class != String
      print 'The key is passed incorrectly!'
      exit
    elsif (key.to_i.to_s).rjust(5, '0') != key
      print 'The key is not a number!'
      exit
    elsif key.length > 5
      print 'The key is too long!'
      exit
    end
    true
  end
end
