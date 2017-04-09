class VotesController < ApplicationController
	
	def create
		post = Post.find_by(id: params[:post_id])
		vote = post.votes.new(voter_id: current_user.id)
		if vote.save
			redirect_to post_path(params[:post_id])
		else
			"sucks to suck"
		end
	end

	def destroy
	end
end