require 'date'
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
    file_data = @user_file.read.strip
    file_data.downcase.chars.select do |character|
      alphabet = (("a".."z").to_a << " ")
      alphabet.include?(character)
    end.join
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
    result = @enigma.encrypt(clean_message, @key, clean_date)
    encrypted_message = result[:encryption]
    write_encrypted_file(encrypted_message)
    p "Created '#{@output_file.path}' with key #{result[:key]} and date #{result[:date]}"
  end

  def write_encrypted_file(message)
    @output_file.write(message)
    @output_file.close
  end

  def decrypt
    result = @enigma.decrypt(clean_message, @key, clean_date)
    decrypted_message = result[:decryption]
    write_decrypted_file(decrypted_message)
    p "Created '#{@output_file.path}' with key #{result[:key]} and date #{result[:date]}"
  end

  def write_decrypted_file(message)
    @output_file.write(message)
    @output_file.close
  end
end
