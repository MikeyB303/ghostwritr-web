class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:sessions][:email])
		if user && user.authenticate(params[:sessions][:password])
			session[:user_id] = user.id
			redirect_to '/'
		else
			@errors = ["Invalid email/password combination"]
			render new_session_path
		end
	end

	def destroy
		session.destroy
		redirect_to "/"
	end
end