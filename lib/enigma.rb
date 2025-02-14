require 'date'
require './lib/encryption'
require './lib/decryption'

class Enigma

  def encrypt(message, key, date)
    encrypt = {
      :encryption => encrypt_message(message, key, date),
      :key => key,
      :date => date
    }
  end

  def encrypt_message(message, key, date)
    encrpytion = Encryption.new(message, key, date)
    encrpytion.encrypted_message
  end

  def decrypt(message, key, date)
    decrypt = {
      :decryption => decrypt_message(message, key, date),
      :key => key,
      :date => date
    }
  end

  def decrypt_message(message, key, date)
    decrpytion = Decryption.new(message, key, date)
    decrpytion.decrypted_message
  end
end
