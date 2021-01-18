require './lib/enigma'
require './lib/encryption'
require './lib/decryption'

user_input = UserInput.new(ARGV[0], ARGV[1])
user_input.encrypt

# user_message = File.open(ARGV[0], "r")
# message = user_message.read.strip
#
# enigma = Enigma.new
# user_encrypt = enigma.encrypt(message)
# encrypted_user_message = user_encrypt[:encryption]
#
# encrypted_file = File.open(ARGV[1], "w")
# encrypted_file.write(encrypted_user_message)
# encrypted_file.close
#
# puts "Created '#{ARGV[1]}' with key #{user_encrypt[:key]} and date #{user_encrypt[:date]}"
