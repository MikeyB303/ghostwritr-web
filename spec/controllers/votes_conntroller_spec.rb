require 'rails_helper'

describe VotesController do
	let!(:user) {User.create!(username: "mikey", email: "test@email.com", password: "password")}
	let!(:published_post) {Post.create!(author_id: user.id, title: "Harry Potter 20", text: "Wacky Wizards", published?: true)}
	let!(:comment) {Comment.create!(post_id: published_post.id, commenter_id: user.id, body: "what up though")}

	it "creates a new  comment vote" do
		session[:user_id] = user.id
		post :create, {params: {comment_id: comment.id}}
		expect(response).to redirect_to "/posts/#{comment.post.id}"
	end

	it "creates a new  comment post" do
		session[:user_id] = user.id
		post :create, {params: {post_id: published_post.id}}
		expect(response).to redirect_to "/posts/#{published_post.id}"
	end
end