require './lib/user_info_transfer'

user_info_transfer = UserInfoTransfer.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
user_info_transfer.decrypt
