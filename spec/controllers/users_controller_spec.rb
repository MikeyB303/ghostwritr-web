require 'rails_helper'

describe UsersController do
  describe 'Creating a new user' do
    it "renders users#new on GET users/new" do
      get :new
      expect(response).to render_template'new'
    end

    it 'redirects to / if valid registration' do
      post :create, {params: {users: {username: "mikey", email: "test@email.com", password: "password"}}}
      expect(response).to redirect_to '/'
    end

    it 'creates a new user if valid registration' do
      expect{post :create, {params: {users: {username: "mikey", email: "test@email.com", password: "password"}}}}.to change{User.all.length}.by(1)
    end

    it 'renders users#new if invalid registration' do
      post :create, {params: {users: {username: "", email: "", password: ""}}}
      expect(response).to render_template 'new'       
    end

    it 'DOES NOT create new user if invalid login' do
      expect{post :create, {params: {users: {username: "", email: "test@email.com", password: "password"}}}}.to change{User.all.length}.by(0)
    end
  end

  describe 'User show page' do
    let!(:user) {User.create!(username: "mikey", email: "test@email.com", password: "password")}
    let!(:published_post) {Post.create!(author_id: user.id, title: "Harry Potter 20", text: "Wacky Wizards", published?: true)}
    let!(:unpublished_post) {Post.create!(author_id: user.id, title: "Harry Potter 20", text: "Wacky Wizards", published?: false)}
    it 'renders users#show' do
      get :show, {params: {id: user.id}}
      expect(response).to render_template'show'
    end

    it 'assigns @user to the page owner' do
      get :show, {params: {id: user.id}} 
      expect(assigns(:user)).to eq(User.find_by id: user.id)
    end

    it 'assigns @user_published_posts to published posts' do
      get :show, {params: {id: user.id}} 
      expect(assigns(:user).posts.select {|post| post.published?}).to include(published_post) 
    end

    it 'assigns @user_unpublished_posts to unpublished posts' do
      get :show, {params: {id: user.id}} 
      expect(assigns(:user).posts.reject {|post| post.published?}).to include(unpublished_post)
    end

  end
end