require './test/test_helper'
require './lib/user_input'

class UserInputTest < MiniTest::Test

  def setup
    @user_input = UserInput.new('message.txt', 'encrypted.txt')
  end

  def test_it_exists
    assert_instance_of UserInput, @user_input
  end

  def test_it_can_clean_date
    expect = (Time.new).strftime('%d%m%g')
    assert_equal expect, @user_input.clean_date
  end

  def test_it_can_generate_key
    keys = @user_input.key_generator

    assert_equal String, keys.class
    assert_equal 5, keys.length

    keys.stubs(:key_generator).returns("00121")
    assert_equal "00121", keys.key_generator
  end

  def test_it_can_encrypt_a_message_and_output
    assert_equal 1, @user_input.encrypt
  end
end
