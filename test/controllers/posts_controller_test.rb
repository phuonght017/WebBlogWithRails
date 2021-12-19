require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  Rails.application.configure do
    routes.default_url_options[:locale] = :en
  end

  setup do
    @user = users(:one)
    @post = posts(:two)
  end

  test "should get new" do
    get new_post_url
    assert_redirected_to login_url
  end

  test "should create post" do
    post posts_url, params: { post: { title: 'title', content: 'content', topic: 'family', user_id: 'MyString'} }
    assert_redirected_to login_url
  end

  test "should show post" do
    get post_url(@post.id)
    assert_redirected_to login_url
  end

  test "should get edit" do
    get edit_post_path(@post.id)
    assert_redirected_to login_url
  end

  test "should update user" do
    patch post_url(@post.id), params: { post: { title: 'title', content: 'content', topic: 'family', user_id: 'MyString'} }
    assert_redirected_to login_url
  end

  test "should destroy post" do
    delete post_url(@post.id)
    assert_redirected_to login_url
  end
end
