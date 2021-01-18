require './test/test_helper'
require './lib/enigma'

class EnigmaTest < MiniTest::Test

  def setup
    @text = "hello world"
    @key = "02715"
    @date = "040895"
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt_a_message
    expect = {
      encryption: "keder ohulw",
      key:        "02715",
      date:       "040895"}

    assert_equal "keder ohulw", @enigma.encrypt_message(@text, @key, @date)
    assert_equal expect, @enigma.encrypt(@text, @key, @date)
  end

  def test_it_can_decrypt_a_message
    encrypted_message = "keder ohulw"

    expect = {
      decryption: "hello world",
      key:        "02715",
      date:       "040895"}


    assert_equal "hello world", @enigma.decrypt_message(encrypted_message, @key, @date)
    assert_equal expect, @enigma.decrypt(encrypted_message, @key, @date)
  end
end
