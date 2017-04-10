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
    
    st = author.works.where('previous_term in (?)', words).order(probability: :desc)
    
    render json: st
  end
  
  def rowling
    file = File.read('j-k-rowling-probability-chain.json')
    render json: file
  end

  def got
    file = File.read('got-probability-chain.json')
    render json: file
  end


end