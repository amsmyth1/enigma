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
    assert_equal [:A, :B, :C, :D], @decryption.shifts.keys
    assert_equal 3, @decryption.shifts[:A]
    assert_equal 27, @decryption.shifts[:B]
    assert_equal 73, @decryption.shifts[:C]
    assert_equal 20, @decryption.shifts[:D]
    assert_equal 6, @decryption.offset(1)
    assert_equal 7, @decryption.offset(2)
    assert_equal 2, @decryption.offset(3)
    assert_equal 4, @decryption.offset(4)
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

  def test_decrypted_message
    assert_equal "hello world", @decryption.decrypted_message
  end
end
