class Security
  def self.check_input(security_hash)
    Security.message_check(security_hash[:message])
    # Security.offset_check(security_hash[:offset])
    # Security.date_check(security_hash[:date])
  end
  def self.message_check(message)
    if message.class != String
      puts 'Your message cannot be translated!'
      exit
    end
    true
  end
end
