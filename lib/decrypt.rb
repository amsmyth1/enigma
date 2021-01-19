require './lib/user_input'

user_input = UserInfoTransfer.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
user_input.decrypt
