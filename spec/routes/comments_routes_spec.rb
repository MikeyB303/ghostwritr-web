require "rails_helper"

RSpec.describe "comments routes", :type => :routing do
	it "routes GET comments/new to comments#new " do
		expect(:get => '/posts/2/comments/new').to route_to("comments#new", :post_id => "2")
	end

	it "routes POST comments/create to comments#create" do
		expect(:post => "/posts/2/comments").to route_to("comments#create", :post_id =>"2")
	end

	it "routes DESTROY comments/destroy to comments#destroy" do
		expect(:delete => "/posts/2/comments/3").to route_to("comments#destroy", :post_id => "2", :id => "3")
	end

end