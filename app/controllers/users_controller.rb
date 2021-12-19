class UsersController < ApplicationController
  def index
    if current_user
      @users = User.all
    else
      redirect_to :login, notice: "You need to log in to access more pages"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :root #sau sua thanh root
    else
      redirect_to :new_user, notice: "Invalid information. Cannot register"
    end
  end
  
  def show
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to :login, notice: "You need to log in to access more pages"
    end
  end

  def update
    if current_user
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to :root #sau sua thanh root
      else
        redirect_to :edit, notice: "Invalid information. Cannot save changes"
      end
    else
      redirect_to :login, notice: "You need to log in to access more pages"
    end
  end
  
  def edit
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to :login, notice: "You need to log in to access more pages"
    end
  end
  
  def destroy
    if current_user
      @user = User.find(params[:id])
      @user.destroy  
      redirect_to :root #sau se sua
    else
      redirect_to :login, notice: "You need to log in to access more pages"
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
