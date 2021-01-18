require './lib/user_input'

user_input = UserInput.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
user_input.decrypt


# require './lib/enigma'
# require './lib/encryption'
# require './lib/decryption'
#
#
# user_decrypted_message = File.open(ARGV[0], "r")
# message = user_decrypted_message.read.strip
#
# enigma = Enigma.new
# user_decrypt = enigma.decrypt(message, ARGV[2], ARGV[3])
# decrypted_user_decrypted_message = user_decrypt[:decryption]
#
# decrypted_file = File.open(ARGV[1], "w")
# decrypted_file.write(decrypted_user_decrypted_message)
# decrypted_file.close
#
# puts "Created '#{ARGV[1]}' with key #{user_decrypt[:key]} and date #{user_decrypt[:date]}"
