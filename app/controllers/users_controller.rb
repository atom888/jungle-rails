class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    @user.email = User.clean_email(@user.email)
    if @user.save
      session[:user_id] = @user.id
      # UserMailer.welcome_email(@user).deliver_later
      redirect_to '/'
    else
      flash[:error] = 'An error occured!'
      redirect_to '/signup'
    end
  end



  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
