class VotesController < ApplicationController
	before_action :load_voteable

	
	# def create
	# 	puts "*" * 30
	# 	if params[:comment_id]
	# 		comment = Comment.find_by(id:params[:comment_id])
	# 		vote = comment.votes.new(voter_id: current_user)
	# 		if comment.save
	# 			redirect_to post_path(params[:post_id])
	# 		else
	# 			"sucks to suck"
	# 		end
	# 	else
	# 		post = Post.find_by(id: params[:post_id])
	# 		vote = post.votes.new(voter_id: current_user.id)
	# 		if vote.save
	# 			redirect_to post_path(params[:post_id])
	# 		else
	# 			"sucks to suck"
	# 		end
	# 	end
	# end
	def create 
		@vote = @voteable.votes.new(allowed_params)
		if @vote.save
			redirect_to post_path(params[:post_id])
		else
		end

	end

	private

	def load_voteable
		resource, id = request.path.split('/')[1,2]
		@voteable = resource.singularize.classify.constantize.find(id)
	end

end