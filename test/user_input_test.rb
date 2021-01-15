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
    date = Time.new(2021, 1, 14)
    assert_equal "140121", @user_input.clean_date(date)
  end

  def test_it_can_generate_key
    keys = @user_input.key_generator

    assert_equal String, keys.class
    assert_equal 5, keys.length

    keys.stubs(:key_generator).returns("00121")
    assert_equal "00121", keys.key_generator
  end
end
