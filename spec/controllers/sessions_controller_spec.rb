require 'rails_helper'

describe SessionsController do
  describe "POST sessions#create" do
    let!(:user) {User.create!(username: "mikey", email: "test@email.com", password: "password")}
    it "redirects to 'post#index' if vailid login" do
      post :create, {params: {sessions: {email: "test@email.com", password: "password"}}}
      expect(response).to redirect_to '/'
    end

    it "sets the session id if succesful login" do
      post :create, {params: {sessions: {email: "test@email.com", password: "password"}}}
      expect(session[:user_id]).to be user.id
    end

    it "renders new page if invailid " do
      post :create, {params: {sessions: {email: "test@email.com", password: "false-password"}}}
      expect(response).to render_template("sessions/new")
    end
  end
  describe "Delete session" do
    let!(:user) {User.create!(username: "mikey", email: "test@email.com", password: "password")}
    #TODO test destroys route
    # it "destroys session if log out" do
    #   delete :destroy
    #   expect(session[:user_id]).to be nil
    # end
  end

end
