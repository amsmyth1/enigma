require 'date'
require './lib/encryption'
require './lib/decryption'
require './lib/enigma'

class UserInput
  attr_reader :key, :user_file, :output_file

  def initialize(user_file, output_file, key = key_generator, date = Time.now)
    @user_file = File.open(user_file, "r")
    @output_file = File.open(output_file, "w")
    @enigma = Enigma.new
    @key = key
    @date = date
  end

  def clean_message
    @user_file.read.strip
  end

  def clean_date
    if @date.class == Time
      @date.strftime('%d%m%g')
    elsif @date.class == String
      @date
    end
  end

  def key_generator
    "%05d" %rand(99999)
  end

  def encrypt
    @enigma.encrypt(clean_message, @key, clean_date)
    puts "Created '#{ARGV[1]}' with key #{user_encrypt[:key]} and date #{user_encrypt[:date]}"
  end

  def encrypted_message
    encrypt[:encryption]
  end

  def write_encrypted_file
    @output_file.write()
  end
end



# enigma = Enigma.new
# user_encrypt = enigma.encrypt(message)
# encrypted_user_message = user_encrypt[:encryption]
#
# encrypted_file = File.open(ARGV[1], "w")
# encrypted_file.write(encrypted_user_message)
# encrypted_file.close
#
# puts "Created '#{ARGV[1]}' with key #{user_encrypt[:key]} and date #{user_encrypt[:date]}"
