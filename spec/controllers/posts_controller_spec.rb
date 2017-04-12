require 'rails_helper'

describe PostsController do
  let!(:user) {User.create!(username: "mikey", email: "test@email.com", password: "password")}
  let!(:published_post) {Post.create!(author_id: user.id, title: "Harry Potter 20", text: "Wacky Wizards", published?: true)}
  let!(:unpublished_post) {Post.create!(author_id: user.id, title: "Harry Potter 20", text: "Wacky Wizards", published?: false)}  
  let!(:posts) {Post.all}
  let!(:invalid_post) {Post.create(author_id: user.id, title: "Bad Post 10")}
  
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

    it 'redirects to post#show if valid posting' do
      session[:user_id] = user.id
      post :create, {params: {posts: {title: "Harry Potter 20", text: "Wacky Wizards"}}}
      expect(response).to redirect_to "/posts/#{posts.last.id}"
    end

    it 'renders new if post was invalid' do
      session[:user_id] = user.id
      post :create, {params: {posts: {title: "Harry Potter 20"}}}
      expect(response).to render_template(:new)
    end

    it 'errors if post was invalid' do
      bad_post = Post.new
      bad_post.save
      expect(bad_post.errors.full_messages).to include("Author must exist", "Title can't be blank", "Text can't be blank", "Author can't be blank")   
    end

  end

  describe "Edit a post" do
    it "renders a edit template" do
      session[:user_id] = user.id
      get :edit, {params: {id: published_post.id}}
      expect(response).to render_template(:edit)
    end
  end

  describe "Update a post" do
    it 'redirects to post#show if valid update' do
      session[:user_id] = user.id
      put :update, params: {:id => published_post.id, :posts => {author_id: user.id, title: "harry potter turns 21", text:"Wacky", published?: true}}
      expect(response).to redirect_to(post_path)
    end

    it 'renders posts#edit if invalid update' do
      session[:user_id] = user.id
      put :update, params: {:id => published_post.id, :posts => {author_id: user.id, title: ""}}
      expect(response).to render_template 'edit'
    end

    it 'errors if post was invalid' do
      invalid_post.save
      expect(invalid_post.errors.full_messages).to include("Text can't be blank")   
    end    
  end

  describe "destroy a post" do
    it "redirects to / "do
      session[:user_id] = user.id
      delete :destroy, {params: {id: published_post.id}}
      expect(response).to redirect_to root_path
    end
   end

end