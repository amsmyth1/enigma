require 'date'
require './lib/encryption'
require './lib/decryption'

class Enigma

  def encrypt(message, key = key_generator, date = Time.now)
    encrypt = {
      :encryption => encrypt_message(message, key, clean_date(date)),
      :key => key,
      :date => clean_date(date)
    }
  end

  def encrypt_message(message, key, date)
    encrpytion = Encryption.new(message, key, date)
    encrpytion.encrypted_message
  end

  def decrypt(message, key = key_generator, date = Time.now)
    decrypt = {
      :decryption => decrypt_message(message, key, clean_date(date)),
      :key => key,
      :date => clean_date(date)
    }
  end

  def decrypt_message(message, key, date)
    decrpytion = Decryption.new(message, key, date)
    decrpytion.decrypted_message
  end

  def clean_date(date)
    if date.class == Time
      date.strftime('%d%m%g')
    elsif date.class == String
      date
    end
  end

  def key_generator
    "%05d" %rand(99999)
  end
end
