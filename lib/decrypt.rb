require './lib/enigma'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

message = handle.read

writer = File.open(ARGV[1], "w")

writer.write(enigma.decrypt(message, ARGV[2], ARGV[3])[:decryption])

p "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"

writer.close
