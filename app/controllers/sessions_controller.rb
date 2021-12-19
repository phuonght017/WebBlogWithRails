class SessionsController < ApplicationController
  def new
    session[:user_id] = nil;
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.username
      redirect_to :root, notice: 'User logged in'        
    else
      redirect_to login_path, notice: 'Invalid Email or Password'
    end
  end
    
  def destroy
    session[:users_id] = nil
    redirect_to :login, notice: 'User logged out'   
  end
end
