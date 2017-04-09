class CommentsController < ApplicationController
	def new
	end

	def create
	end

	private
	def comment_params
		params.require(:comments).permit(:post_id, :commenter_id, :body)
	end
end
