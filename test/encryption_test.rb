require 'minitest/autorun'
require 'minitest/pride'
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
  #
  # def test_it_can_assign_text_shift_case_characters
  #   assert_equal ["h", "o", "r"], @encryption.shift_case_characters[:A]
  #   assert_equal ["e", " ", "l"], @encryption.shift_case_characters[:B]
  #   assert_equal ["l", "w", "d"], @encryption.shift_case_characters[:C]
  #   assert_equal ["l", "o"], @encryption.shift_case_characters[:D]
  # end
  #
  # def test_encrypted_characters #keder ohulw
  #   assert_equal ["k", "r", "u"], @encryption.encrypted_characters[:A]
  #   assert_equal ["e", " ", "l"], @encryption.encrypted_characters[:B]
  #   assert_equal ["d", "o", "w"], @encryption.encrypted_characters[:C]
  #   assert_equal ["e", "r"], @encryption.encrypted_characters[:D]
  # end
  #
  # def test_encrypted_message
  #   assert_equal "keder ohulw", @encryption.encrypted_message
  # end
end
