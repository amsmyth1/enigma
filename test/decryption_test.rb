require './test/test_helper'
require './lib/enigma'
require './lib/Decryption'

class DecryptionTest < MiniTest::Test

  def setup
    @message = "keder ohulw"
    @key = "02715"
    @date = "040895"
    @decryption = Decryption.new(@message, @key, @date)
  end

  def test_it_exists_with_readable_attributes
    assert_instance_of Decryption, @decryption
    assert_equal "keder ohulw", @decryption.message
    assert_equal "02715", @decryption.key
    assert_equal "040895", @decryption.date
  end

  def test_alphabet
    skip #do we need to test for a constant?
    assert_equal "a", @decryption.alphabet.first
    assert_equal String, @decryption.alphabet.first.class
    assert_equal " ", @decryption.alphabet.last
    assert_equal 27, @decryption.alphabet.count
  end

  def test_it_generates_keys_and_offsets
    assert_equal [:A, :B, :C, :D], @decryption.decryption_shifts.keys
    assert_equal 3, @decryption.decryption_shifts[:A]
    assert_equal 27, @decryption.decryption_shifts[:B]
    assert_equal 73, @decryption.decryption_shifts[:C]
    assert_equal 20, @decryption.decryption_shifts[:D]
  end

  def test_alpha
    assert_equal :A, @decryption.alpha("k", 0)
    assert_equal :B, @decryption.alpha("e", 1)
    assert_equal :C, @decryption.alpha("d", 2)
    assert_equal :D, @decryption.alpha("l", 3)
    assert_equal :A, @decryption.alpha("e", 4)
    assert_equal :B, @decryption.alpha(" ", 5)
    assert_equal :C, @decryption.alpha("o", 6)
    assert_equal :D, @decryption.alpha("h", 7)
  end

  def test_it_can_assign_text_shift_case_characters
    skip
    assert_equal ["k", "r", "u"], @decryption.shift_case_characters[:A]
    assert_equal ["e", " ", "l"], @decryption.shift_case_characters[:B]
    assert_equal ["d", "o", "w"], @decryption.shift_case_characters[:C]
    assert_equal ["e", "h"], @decryption.shift_case_characters[:D]
  end

  def test_encrypted_message
    skip
    assert_equal "keder ohulw", @decryption.encrypted_message
  end
end
