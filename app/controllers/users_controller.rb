class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      # Handle a successful save.
      redirect_to(:controller => 'static_pages', :action => 'home')
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def user_params
  	params.require(:users).permit(:name, :email, :password, :password_confirmation)
  end
end
