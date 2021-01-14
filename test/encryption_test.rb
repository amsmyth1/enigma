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
    assert_equal [:A, :B, :C, :D], @enigma.encryption_shifts.keys
    assert_equal [02, 1], @enigma.encryption_shifts[:A]
    assert_equal [02, 1], @enigma.encryption_shifts[:B]
    assert_equal [02, 1], @enigma.encryption_shifts[:C]
    assert_equal [02, 1], @enigma.encryption_shifts[:D]
  end

  def test_it_can_assign_text_shift_case_characters
    assert_equal ["h", "o", "r"], @enigma.shift_case_characters[:A]
    assert_equal ["e", " ", "l"], @enigma.shift_case_characters[:B]
    assert_equal ["l", "w", "d"], @enigma.shift_case_characters[:C]
    assert_equal ["l", "o"], @enigma.shift_case_characters[:D]
  end

  def test_encrypted_characters #keder ohulw
    assert_equal ["k", "r", "u"], @enigma.encrypted_characters[:A]
    assert_equal ["e", " ", "l"], @enigma.encrypted_characters[:B]
    assert_equal ["d", "o", "w"], @enigma.encrypted_characters[:C]
    assert_equal ["e", "r"], @enigma.encrypted_characters[:D]
  end

  def test_encrypted_message
    assert_equal "keder ohulw", @encryption.encrypted_message
  end
end 
