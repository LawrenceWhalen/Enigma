require './lib/enigma'

reader = File.open(ARGV[0], 'r')

encrypted_text = reader.read

reader.close

unencrypted_hash = Enigma.decrypt(encrypted_text, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], 'w')

writer.write(unencrypted_hash[:decryption])

writer.close

puts "Created '#{ARGV[1]}' with the key #{unencrypted_hash[:key]} and date #{unencrypted_hash[:date]}"