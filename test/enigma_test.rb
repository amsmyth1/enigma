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

  def test_it_can_clean_date
    date = Time.now
    assert_equal "140121", @enigma.clean_date(date)
  end

  def test_it_can_generate_key
    keys = @enigma.key_generator

    assert_equal String, keys.class
    assert_equal 5, keys.length

    keys.stubs(:key_generator).returns("00121")
    assert_equal "00121", keys.key_generator
  end

  def test_it_can_encrypt_a_message
    expect = {
      encryption: "keder ohulw",
      key:        "02715",
      date:       "040895"}

    text = "alexa morales smyth"
    expect2 = {
      encryption: "u rzuozqkpygloeorhu",
      key:        "70901",
      date:       "140121"}

    @enigma.stubs(:key_generator).returns("70901")
    assert_equal "keder ohulw", @enigma.encrypt_message(@text, @key, @date)
    assert_equal expect, @enigma.encrypt(@text, @key, @date)
    assert_equal expect2, @enigma.encrypt(text)
  end
end
