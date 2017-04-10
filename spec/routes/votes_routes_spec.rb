require 'rails_helper'

RSpec.describe "votes routes", :type => :routing do 
	it "routes POST /posts/2/votes" do
		expect(:post => "/posts/2/votes").to route_to("votes#create", :post_id => "2")
	end

	it "routes POST /comments/2/votes" do
		expect(:post => "/comments/2/votes").to route_to("votes#create", :comment_id => "2")
	end
end