class HomeController < ApplicationController

  def index
    
  end

  def shakespeare
    author = Author.find_by(name: 'William Shakespeare')
    user_input = params[:posts][:text].split
    
    if user_input.length >= 3
      words = [user_input[-3..-1].join('_'), user_input[-2..-1].join('_'), user_input[-1]]
    elsif user_input.length == 2
      words = [user_input[-2..-1].join('_'), user_input[-1]]
    else
      words = user_input[0]
    end
    
    predictions = author.works.where('previous_term in (?)', words).order(probability: :desc).limit(10)
    
    render json: predictions
  end
  
  def rowling
    author = Author.find_by(name: 'J-K Rowling')
    user_input = params[:posts][:text].split
  
    if user_input.length >= 3
      words = [user_input[-3..-1].join('_'), user_input[-2..-1].join('_'), user_input[-1]]
    elsif user_input.length == 2
      words = [user_input[-2..-1].join('_'), user_input[-1]]
    else
      words = user_input[0]
    end
  
    predictions = author.works.where('previous_term in (?)', words).order(probability: :desc).limit(10)
  
    render json: predictions
  end

  def got
    author = Author.find_by(name: 'George R.R. Martin')
    user_input = params[:posts][:text].split
  
    if user_input.length >= 3
      words = [user_input[-3..-1].join('_'), user_input[-2..-1].join('_'), user_input[-1]]
    elsif user_input.length == 2
      words = [user_input[-2..-1].join('_'), user_input[-1]]
    else
      words = user_input[0]
    end
  
    predictions = author.works.where('previous_term in (?)', words).order(probability: :desc).limit(10)
  
    render json: predictions
  end


end