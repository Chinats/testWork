require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "名前が空ならvalidateでエラーになる" do
    user = users(:two)
    assert_not user.valid?
    assert_equal user.errors.details, {:name=>[{:error=>:blank}]}
  end
  test "メールアドレスに@が含まれていなければvalidateでエラーになる" do
    user = users(:two)
    assert_not user.valid?
  end
end
