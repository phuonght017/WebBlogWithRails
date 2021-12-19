require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  Rails.application.configure do
    routes.default_url_options[:locale] = :en
  end

  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_redirected_to login_url
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: 'email', password: 'secret', password_confirmation: 'secret', username: @user.username } }
    end

    assert_redirected_to root_url
  end

  test "should show user" do
    get user_url(@user)
    assert_redirected_to login_url
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_redirected_to login_url
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, password: 'secret', password_confirmation: 'secret', username: @user.username } }
    assert_redirected_to login_url
  end

  test "should destroy user" do
    delete user_url(@user)
    assert_redirected_to login_url
  end
end
