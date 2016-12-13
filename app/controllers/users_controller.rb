class UsersController < ApplicationController

  before_validation :downcase_email

  def new
  end

  def create
    user = User.new(user_params)
    user.email = email.downcase
    if user.save
      session[:user_id] = user.id
      UserMailer.welcome_email(@user).deliver_later
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

  def downcase_email
    self.email = email.downcase if email.present?
  end

end
