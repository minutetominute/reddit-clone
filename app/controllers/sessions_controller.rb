class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login_user!(@user)
      redirect_to @user
    else
      flash[:error] = "Bad password/email combination"
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to users_url
  end
end
