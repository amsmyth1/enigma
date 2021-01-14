class Enigma

  def initialize(message, key, date)
    @shift_case = {}
    @encription_shifts = {}
  end

  def encrypt(message, key = key_generator, date = Today.now)
    encrypt = {}
    encrypt[:encryption] = Encrypt.new(message, key, date)
    encrypt[:key] = key
    encrypt[:date] = clean_date(date)
    encrypt
  end

  def clean_date(date)
    date.strftime('%d%m%Y')
  end

  def key_generator
    "%05d" %rand(99999)
  end

end
