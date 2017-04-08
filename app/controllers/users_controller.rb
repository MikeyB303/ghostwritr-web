	class UsersController < ApplicationController
		def new
		end

		def create
			@user = User.new(user_params)
			if @user.save
				session[:user_id] = @user.id
				redirect_to "/"
			else
				@errors = @user.errors.full_messages
				render 'new'
			end
		end

		private
		def user_params
			params.require(:users).permit(:username, :email, :password)
		end
	end