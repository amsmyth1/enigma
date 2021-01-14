class Enigma

  def initialize
  end

  def encrypt(message, key = key_generator, date = Today.now)
    encrypt = {}
    encrypt[:encryption] = Encrypt.new(message, key, clean_date(date))
    encrypt[:key] = key
    encrypt[:date] = clean_date(date)
    encrypt
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
