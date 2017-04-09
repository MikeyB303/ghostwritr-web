class VotesController < ApplicationController

	
	def create
		if params[:comment_id]
			comment = Comment.find_by(id:params[:comment_id])
			vote = comment.votes.create!(voter_id: current_user.id)
			if comment.save
				redirect_to post_path(comment.post.id)
			else
				"sucks to suck"
			end
		else
			post = Post.find_by(id: params[:post_id])
			vote = post.votes.new(voter_id: current_user.id)
			if vote.save
				redirect_to post_path(params[:post_id])
			else
				"sucks to suck"
			end
		end
	end

end