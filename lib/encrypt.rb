require './lib/enigma'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

message = handle.read

writer = File.open(ARGV[1], "w")

enigma.encrypt(message)

writer.write(@enigma.encrypt(message)[:encryption])

p "Created #{ARGV[1]} with the key #{@enigma.encrypt(message)[:key]} and date #{@enigma.encrypt(message)[:date]}"

writer.close
