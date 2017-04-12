require 'rails_helper'

describe SessionsController do
  describe "POST sessions#create" do
    let!(:user) {User.create!(username: "mikey", email: "test@email.com", password: "password")}
    it "redirects to 'post#index' if valid login" do
      post :create, {params: {sessions: {email: "test@email.com", password: "password"}}}
      expect(response).to redirect_to '/'
    end

    it "sets the session id if successful login" do
      post :create, {params: {sessions: {email: "test@email.com", password: "password"}}}
      expect(session[:user_id]).to be user.id
    end

    it "renders new page if invalid " do
      post :create, {params: {sessions: {email: "test@email.com", password: "false-password"}}}
      expect(response).to render_template("sessions/new")
    end

    it 'errors out if invalid login' do
      post :create, {params: {sessions: {email: "test@email.com", password: "false-password"}}}
      expect(assigns(:errors)).to eq(["Invalid email/password combination"])
    end
  end
  describe "Delete session" do
    let!(:user) {User.create!(username: "mikey", email: "test@email.com", password: "password")}
    
    it "destroys session if log out" do
      delete :destroy, {params: {id: user.id}}
      expect(session[:user_id]).to be nil
    end
  end
end
