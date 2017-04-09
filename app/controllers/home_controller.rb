class HomeController < ApplicationController

  def index
    
  end

  def shakespeare
    file = File.read('shakespeare-probability-chain.json')
    render json: file
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