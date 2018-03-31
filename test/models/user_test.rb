require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "名前が空ならエラー" do
    user = User.new
    assert_not user.save
  end
end
