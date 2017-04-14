class CommentsController < ApplicationController
	def new
		redirect_to root_path if !logged_in?
		@post = Post.find(params[:post_id])
	end

	def create
		redirect_to root_path if !logged_in?

		new_comment = Comment.new(comment_params)
		new_comment.commenter_id = current_user.id 
		new_comment.post_id = params[:post_id]
		@post = Post.find(params[:post_id])

		respond_to do |format|

			if new_comment.save
				format.html {redirect_to post_path(params[:post_id])}
				format.js {render layout: false }
			else
				@errors = new_comment.errors.full_messages
				format.html {render "comments/new"}
				format.js { render layout: false}
			end
		end
	end

	def destroy
		comment = Comment.find_by(id: params[:id])
		redirect_to root_path if !authorized?(comment.commenter_id)
		comment.destroy
		redirect_to post_path(params[:post_id])
	end

	private
	def comment_params
		params.require(:comments).permit(:post_id, :commenter_id, :body)
	end
end
