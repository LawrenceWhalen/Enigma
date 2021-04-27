require './lib/enigma'
require './lib/security'

reader = File.open(ARGV[0], 'r')

encrypted_text = reader.read

reader.close

enigma = Enigma.new
unencrypted_hash = enigma.decrypt(encrypted_text, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], 'w')

writer.write(unencrypted_hash[:decryption])

writer.close

puts "Created '#{ARGV[1]}' with the key #{unencrypted_hash[:key]} and date #{unencrypted_hash[:date]}"
