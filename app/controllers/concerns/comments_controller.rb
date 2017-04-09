class CommentsController < ApplicationController
	def new
		@post = Post.find(params[:post_id])
	end

	def create
		new_comment = Comment.new(comment_params)
		new_comment.commenter_id = current_user.id 
		new_comment.post_id = params[:post_id]

		if new_comment.save
			redirect_to post_path(params[:post_id])
		else
			@post = Post.find(params[:post_id])
			@errors = new_comment.errors.full_messages
			render "comments/new"
		end

	end

	private
	def comment_params
		params.require(:comments).permit(:post_id, :commenter_id, :body)
	end
end
