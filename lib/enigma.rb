require './lib/encryption'

class Enigma

  def encrypt(message, key = key_generator, date = Today.now)
    encrpytion = Encryption.new(message, key, date)
    encrpytion.encrypted_message
  end

  def clean_date(date)
    if date.class == Time
      date.strftime('%d%m%Y')
    end
  end

  def key_generator
    "%05d" %rand(99999)
  end
end
