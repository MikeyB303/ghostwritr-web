require 'rails_helper'

describe CommentsController do
	let!(:user) {User.create!(username: "mikey", email: "test@email.com", password: "password")}
	let!(:published_post) {Post.create!(author_id: user.id, title: "Harry Potter 20", text: "Wacky Wizards", published?: true)}
	let!(:comment) {Comment.create!(post_id: published_post.id, commenter_id: user.id, body:"main body")}
	
	describe "Get comments#new" do
		it "renders a new template" do
			session[:user_id] = user.id
			get :new, params: {:post_id => published_post.id}
			expect(response).to render_template(:new)
		end
	end

	describe "Creating a new comment " do
		it "redirects to post path if valid submit" do
			session[:user_id] = user.id
			post :create, params: {:post_id => published_post.id, :comments => {post_id: published_post.id, commenter_id: user.id, body: "test body"}}
			expect(response).to redirect_to "/posts/#{published_post.id}"
		end
		it "renders comments/new if invalid" do
			session[:user_id] = user.id
			post :create, params: {:post_id => published_post.id, :comments => {commenter_id: user.id}}
			expect(response).to render_template "comments/new"
		end

		it 'assigns errors if invalid' do
			session[:user_id] = user.id
			post :create, params: {:post_id => published_post.id, :comments => {commenter_id: user.id}}
			expect(assigns(:errors)).to eq(["Body can't be blank"])
		end
	end
	
	describe "Destroys a comment" do
		it "redirects to post#show" do
			session[:user_id] = user.id
			delete :destroy, params: {:post_id => published_post.id, :id => comment.id}
			expect(response).to redirect_to "/posts/#{published_post.id}" 
		end
	end
end