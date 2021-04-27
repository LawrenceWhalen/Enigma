require './lib/enigma'
require './lib/security'

reader = File.open(ARGV[0], 'r')

unecrypted_text = reader.read

reader.close

enigma = Enigma.new
encrypted_hash = enigma.encrypt(unecrypted_text)

writer = File.open(ARGV[1], 'w')

writer.write(encrypted_hash[:encryption])

writer.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_hash[:key]} and date #{encrypted_hash[:date]}"
