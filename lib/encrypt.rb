require './lib/user_input'

user_input = UserInput.new(ARGV[0], ARGV[1])
user_input.encrypt
