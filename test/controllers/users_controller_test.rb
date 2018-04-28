require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get user_session_url
    assert_response :success
  end

  test "should get new" do
    get sign_in_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      @user = users(:one)
      post users_url, params: { user: { email: @user.email, name: @user.name, tel: @user.tel } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url
    assert_response :success
  end

  test "should update user" do
    patch user_url, params: { user: { email: @user.email, name: @user.name, tel: @user.tel } }
    assert_redirected_to user_url
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url
    end

    assert_redirected_to users_url
  end

# 追記
  test "新規ユーザー登録ページにのh1が'New User’になっている" do
    get new_user_url
    assert_select "h1", "New User"
  end



end
