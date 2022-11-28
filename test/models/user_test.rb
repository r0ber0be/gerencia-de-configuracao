require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = User.create(
      id: 3,
      name:"John Doe",
      email: "johndoe@example.com",
      password: "123456"
    )
  end

  test "should not have blank name" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "user name should not have more than 80 characters" do
    @user.name = "a" * 81
    assert_not @user.valid?
  end
end
