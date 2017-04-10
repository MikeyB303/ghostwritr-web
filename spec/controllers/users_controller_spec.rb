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
end