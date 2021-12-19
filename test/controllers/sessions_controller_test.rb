require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  Rails.application.configure do
    routes.default_url_options[:locale] = :en
  end

  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should get create" do
    post sessions_path
    assert_redirected_to login_url
  end

  test "should get destroy" do
    get logout_url
    assert_redirected_to login_url
  end
end
