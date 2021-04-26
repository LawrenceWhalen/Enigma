class Security
  def self.check_input(security_hash)
    message_check(security_hash[:message])
    offset_check(security_hash[:offset])
    date_check(security_hash[:date])
  end
end
