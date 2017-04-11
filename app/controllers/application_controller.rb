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
  
  def query_database(author, n_size, words)
    p author.works.where(n_size: n_size).where(previous_term: words).order(probability: :desc).limit(3).pluck(:next_word)
  # TODO: Figure out eager Loading
  end

  def get_predictions(words, author)
    user_input = words.gsub(/[,.;:'"]/, '').split
    
  
    if user_input.length >= 3
      puts "3" * 60
      words = [user_input[-3..-1].join('_')]
      probabilities = query_database(author, 3, words)
      return probabilities if probabilities.length > 0
    end
    
    if user_input.length >= 2
      puts "2" * 60
      words = [user_input[-2..-1].join('_')]
      probabilities = query_database(author, 2, words)
      return probabilities if probabilities.length > 0
    end
    
    if user_input.length >= 1
      puts "1" * 60
      words = user_input[-1]
      probabilities = query_database(author, 1, words)
      return probabilities if probabilities.length > 0
    end
    

  end
end
