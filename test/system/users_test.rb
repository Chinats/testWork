require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = User.create!(email: "example@example.com", password: "1234567")
  end

  test "visiting the sign_up" do
     visit new_user_registration_url

     fill_in "Name", with: "testuser1"
     fill_in "Email", with: "testuser1@xx.xx"
     fill_in "Password", with: "Password"
     fill_in "Password confirmation", with: "Password"

     click_button "Sign up"

     assert_text "Logged in as testuser1@xx.xx."
   end

   test "ログインできること" do
     visit new_user_session_url

     fill_in "Email", with: @user.email
     fill_in "Password", with: "1234567"

     click_button "Log in"

     assert_text "Logged in as #{@user.email}."
   end

   test "ログアウトできること" do
     login(@user.email, "1234567")

     click_link "Logout"

     assert_text "You need to sign in or sign up before continuing."
   end

  test "ログインしている状態でuser一覧にアクセスできる。ログアウトしている状態でuser一覧にアクセスするとsign_inに遷移する。" do
    login(@user.email, "1234567")

    visit users_url

    assert_selector "h1", text: "Users"

    click_link "Logout"

    visit users_url

    assert_selector "h2", text: "Log in"
    assert_text "You need to sign in or sign up before continuing."
    take_screenshot
  end

   def login(email, password)
     visit new_user_session_url
     fill_in "Email", with: email
     fill_in "Password", with: password
     click_button "Log in"
   end

end
