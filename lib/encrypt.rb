require './lib/enigma'
require './lib/security'

reader = File.open(ARGV[0], 'r')

unecrypted_text = reader.read

reader.close

encrypted_hash = Enigma.encrypt(unecrypted_text)

writer = File.open(ARGV[1], 'w')

writer.write(encrypted_hash[:encryption])

writer.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_hash[:key]} and date #{encrypted_hash[:date]}"
