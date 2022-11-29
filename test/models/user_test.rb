# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = User.create(
      id: 3,
      name: 'John Doe',
      email: 'johndoe@example.com',
      password: '123456'
    )
  end

  test 'should not have blank name' do
    @user.name = ''
    assert_not @user.valid?
  end

  test "should not save without name" do
    @user.name = ''
    assert_not @user.save, "Saved the user without a name"
  end

  test "should save user with a name" do
    assert @user.save, "User with a name was saved sucessfully"
  end

  test 'user name should not have more than 80 characters' do
    @user.name = 'a' * 81
    assert_not @user.valid?
  end

  test 'should not accept more than one account with the same email' do
    assert @user.save
    new_user = User.create(email: 'johndoe@example.com')
    assert_not new_user.save
  end
end
