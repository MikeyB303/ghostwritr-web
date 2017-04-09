require 'rails_helper'

RSpec.describe "post routes", :type => :routing do

	it "routes GET posts/new to posts#new" do
		expect(:get => 'posts/new').to route_to('posts#new')
	end

	it "routes GET posts/show to posts#show" do
		expect(:get => 'posts/1').to route_to('posts#show', :id => "1")
	end

	it "routes POST posts/create to posts#create" do
		expect(:post => "/posts").to route_to('posts#create')
	end

	it "routes DESTROY to posts/destroy" do
		expect(:delete => "/posts/1").to route_to("posts#destroy", :id => "1")
	end	

	it "routes PUT to posts/update" do
		expect(:put => "/posts/1").to route_to("posts#update", :id => "1")
	end	


end