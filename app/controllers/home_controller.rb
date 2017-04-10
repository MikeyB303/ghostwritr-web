class HomeController < ApplicationController

  def shakespeare
    author = Author.find_by(name: 'William Shakespeare')
    
    render json: get_predictions(params[:posts][:text], author)
  end
  
  def rowling
    author = Author.find_by(name: 'J-K Rowling').id
  
    p params
    render json: get_predictions(params[:posts][:text], author)
  end

  def got
    author = Author.find_by(name: 'George R.R. Martin').id
    
    render json: get_predictions(params[:posts][:text], author)
  end


end