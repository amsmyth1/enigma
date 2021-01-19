require './lib/user_input'

user_input = UserInfoTransfer.new(ARGV[0], ARGV[1])
user_input.encrypt
