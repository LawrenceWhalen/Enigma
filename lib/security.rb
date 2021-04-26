require 'time'

class Security
  def self.check_input(security_hash)
    Security.message_check(security_hash[:message])
    Security.key_check(security_hash[:key])
    Security.date_check(security_hash[:date])
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
    elsif key.length > 5
      print 'The key is too long!'
      exit
    elsif (key.to_i.to_s).rjust(5, '0') != key
      print 'The key is not a number!'
      exit
    end
    true
  end
  def self.date_check(date)
    if date.class != String
      print 'The date was passed incorrectly!'
      exit
    elsif date.length > 6
      print 'The date is improperly formatted.'
      exit
    elsif (date.to_i.to_s).rjust(6, '0') != date
      print 'The date includes excluded characters.'
      exit
    elsif !Date.valid_date?(date[4..5].to_i, date[2..3].to_i, date[0..1].to_i)
      print 'The date is improperly formatted, or a bad date.'
      exit
    end
    true
  end
end
