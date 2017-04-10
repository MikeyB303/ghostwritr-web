class HomeController < ApplicationController

  def shakespeare
    author_id = Author.find_by(name: 'William Shakespeare').id
    
    render json: get_predictions(params[:posts][:text], author_id)
  end
  
  def rowling
    author_id = Author.find_by(name: 'J-K Rowling').id

    render json: get_predictions(params[:posts][:text], author_id)
  end

  def got
    author_id = Author.find_by(name: 'George R.R. Martin').id
    
    render json: get_predictions(params[:posts][:text], author_id)
  end


end