require './test/test_helper'
require './lib/user_info_transfer'

class UserInfoTransferTest < MiniTest::Test

  def setup
    @user_info_transfer = UserInfoTransfer.new('./test_data/test_message.txt', './test_data/test_output.txt')
  end

  def test_it_exists
    assert_instance_of UserInfoTransfer, @user_info_transfer
  end

  def test_it_has_attributes

    assert_equal File, @user_info_transfer.user_file.class
    assert_equal File, @user_info_transfer.output_file.class
  end

  def test_it_can_clean_message
    assert_equal "hello world", @user_info_transfer.clean_message
  end

  def test_it_can_clean_date
    expect = (Time.new).strftime('%d%m%g')
    assert_equal expect, @user_info_transfer.clean_date
  end

  def test_it_can_generate_key
    keys = @user_info_transfer.key_generator

    assert_equal String, keys.class
    assert_equal 5, keys.length

    keys.stubs(:key_generator).returns("00121")
    assert_equal "00121", keys.key_generator
  end

  def test_it_can_encrypt_a_message_and_output
    message = "Hello world"
    key = "02715"
    date = "040895"
    user_info_transfer = UserInfoTransfer.new('./test_data/test_message.txt', './test_data/test_output.txt', "02715", "040895")
    expect = "Created './test_data/test_output.txt' with key 02715 and date 040895"


    assert_equal expect, user_info_transfer.encrypt
  end

  def test_it_can_decrypt_a_message
    message = "hello world"
    key = "53224"
    date = "180121"
    encrypted_message = "kpkjrkvmuwc"
    decrypt_input = UserInfoTransfer.new('./test_data/test_output.txt', './test_data/test_decrypted.txt', key, date)
    expect = "Created './test_data/test_decrypted.txt' with key 53224 and date 180121"
    assert_equal expect, decrypt_input.decrypt
  end
end
