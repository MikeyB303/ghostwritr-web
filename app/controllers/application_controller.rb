class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :log_in, :logged_in?, :current_user, :authorized?, :author?

  def log_in
    session[:user_id] = user.id
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    return nil if !logged_in?
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authorized?(integer_id)
    session[:user_id] == integer_id.to_i
  end

  def author?(post)
    return true if current_user == post.author
  end

  
end
