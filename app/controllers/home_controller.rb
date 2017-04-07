class HomeController < ApplicationController

  def index
    
  end

  def shakespeare
    file = File.read('shakespeare-probability-chain.json')
    render json: file
  end

end