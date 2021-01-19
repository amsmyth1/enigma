require './lib/user_info_transfer'

user_info_transfer = UserInfoTransfer.new(ARGV[0], ARGV[1])
user_info_transfer.encrypt
