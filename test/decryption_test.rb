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

  def test_it_generates_keys_and_offsets
    assert_equal [:A, :B, :C, :D], @decryption.encryption_shifts.keys
    assert_equal 3, @decryption.encryption_shifts[:A]
    assert_equal 27, @decryption.encryption_shifts[:B]
    assert_equal 73, @decryption.encryption_shifts[:C]
    assert_equal 20, @decryption.encryption_shifts[:D]
  end

  def test_alpha
    assert_equal :A, @decryption.alpha("h", 0)
    assert_equal :B, @decryption.alpha("e", 1)
    assert_equal :C, @decryption.alpha("l", 2)
    assert_equal :D, @decryption.alpha("l", 3)
    assert_equal :A, @decryption.alpha("o", 4)
    assert_equal :B, @decryption.alpha(" ", 5)
    assert_equal :C, @decryption.alpha("w", 6)
    assert_equal :D, @decryption.alpha("o", 7)
  end

  def test_it_can_assign_text_shift_case_characters
    assert_equal ["k", "r", "u"], @decryption.shift_case_characters[:A]
    assert_equal ["e", " ", "l"], @decryption.shift_case_characters[:B]
    assert_equal ["d", "o", "w"], @decryption.shift_case_characters[:C]
    assert_equal ["e", "h"], @decryption.shift_case_characters[:D]
  end

  def test_encrypted_message
    assert_equal "keder ohulw", @decryption.encrypted_message
  end
end
