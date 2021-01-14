require 'minitest/autorun'
require 'minitest/pride'
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

  def test_it_generates_keys_and_offsets
    assert_equal [02, 1], @enigma.encryption_shifts[:A]
    assert_equal [02, 1], @enigma.encryption_shifts[:B]
    assert_equal [02, 1], @enigma.encryption_shifts[:C]
    assert_equal [02, 1], @enigma.encryption_shifts[:D]
  end

  def test_it_can_assign_text_shift_case
    assert_equal ["h", "o", "r"], @enigma.shift_case[:A]
    assert_equal ["e", " ", "l"], @enigma.shift_case[:B]
    assert_equal ["l", "w", "d"], @enigma.shift_case[:C]
    assert_equal ["l", "o"], @enigma.shift_case[:D]
  end

  def test_it_can_encrypt_a_message
    assert_equal "keder ohulw", @enigma.encrypt(@test, @key, @date)
  end
end
