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

		def show
			@user = User.find_by(id: params[:id])
			@user_published_posts = @user.posts.select {|post| post.published?}
			@user_unpublished_posts = @user.posts.reject {|post| post.published?}

		end

		private
		def user_params
			params.require(:users).permit(:username, :email, :password)
		end
	end