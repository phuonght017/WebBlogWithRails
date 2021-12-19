require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.create(username: 'anhtu', email: 'tu@mail.ru', password: 'anhtu', password_confirmation: 'anhtu')
  end
  
  test 'valid user' do
    assert @user.valid?
  end
  
  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end
  
  test 'invalid without password' do
    @user.password = nil
    refute @user.valid?
    assert_not_nil @user.errors[:password]
  end
end
