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
    current_user == post.author
  end

  def get_predictions(words, author)
    user_input = words.split
  
    if user_input.length >= 3
      words = [user_input[-3..-1].join('_'), user_input[-2..-1].join('_'), user_input[-1]]
    elsif user_input.length == 2
      words = [user_input[-2..-1].join('_'), user_input[-1]]
    else
      words = user_input[0]
    end

    author.works.where('previous_term in (?)', words).order(probability: :desc).limit(10)

  end
end
