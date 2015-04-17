class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :login_user!, :current_user, :logged_in?


  def current_user
    @user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  private

  def check_for_author
    redirect_to post_url(@post) unless current_user == @post.author
  end

  def check_for_user
    redirect_to new_session_url unless logged_in?
  end

end
