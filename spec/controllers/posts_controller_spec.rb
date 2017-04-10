require 'rails_helper'

describe PostsController do
  let!(:user) {User.create!(username: "mikey", email: "test@email.com", password: "password")}
  let!(:published_post) {Post.create!(author_id: user.id, title: "Harry Potter 20", text: "Wacky Wizards", published?: true)}
  let!(:unpublished_post) {Post.create!(author_id: user.id, title: "Harry Potter 20", text: "Wacky Wizards", published?: false)}  
  let!(:posts) {Post.all}
  
  describe 'GET posts#index' do
    it 'renders posts#index' do
      get :index
      expect(response).to render_template'index'      
    end

    it 'assigns @post to all published posts sorted by vote amount' do
      get :index
      expect(assigns(:posts).select {|post| post.published?}.sort_by{|post| post.votes.count}.reverse).to include(published_post)
    end
  end

  describe 'Creating a new post' do
    let!(:user) {User.create!(username: "mikey", email: "email.com", password: "password")}
    it 'renders posts#new on GET posts/new' do
      get :new
      expect(response).to render_template 'new'
    end

    it 'redirects to / if valid posting' do
      session[:user_id] = user.id
      post :create, {params: {posts: {title: "Harry Potter 20", text: "Wacky Wizards"}}}
      expect(response).to redirect_to '/'
    end
  end
end