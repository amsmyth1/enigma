require './test/test_helper'
require './lib/enigma'
require './lib/encryption'

class EncryptionTest < MiniTest::Test

  def setup
    @message = "hello world"
    @key = "02715"
    @date = "040895"
    @encryption = Encryption.new(@message, @key, @date)
  end

  def test_it_exists_with_readable_attributes
    assert_instance_of Encryption, @encryption
    assert_equal "hello world", @encryption.message
    assert_equal "02715", @encryption.key
    assert_equal "040895", @encryption.date
  end

  def test_it_generates_keys_and_offsets
    assert_equal [:A, :B, :C, :D], @encryption.encryption_shifts.keys
    assert_equal 3, @encryption.encryption_shifts[:A]
    assert_equal 27, @encryption.encryption_shifts[:B]
    assert_equal 73, @encryption.encryption_shifts[:C]
    assert_equal 20, @encryption.encryption_shifts[:D]
  end

  def test_alpha
    assert_equal :A, @encryption.alpha("h", 0)
    assert_equal :B, @encryption.alpha("e", 1)
    assert_equal :C, @encryption.alpha("l", 2)
    assert_equal :D, @encryption.alpha("l", 3)
    assert_equal :A, @encryption.alpha("o", 4)
    assert_equal :B, @encryption.alpha(" ", 5)
    assert_equal :C, @encryption.alpha("w", 6)
    assert_equal :D, @encryption.alpha("o", 7)
  end

  def test_it_can_assign_text_shift_case_characters
    assert_equal ["h", "o", "r"], @encryption.shift_case_characters[:A]
    assert_equal ["e", " ", "l"], @encryption.shift_case_characters[:B]
    assert_equal ["l", "w", "d"], @encryption.shift_case_characters[:C]
    assert_equal ["l", "o"], @encryption.shift_case_characters[:D]
  end

  def test_encrypted_message
    assert_equal "keder ohulw", @encryption.encrypted_message
  end
end
