module VotesHelper
	# if current user already voted return false
	def voted?(post)
		post.votes.each do |vote|
			if vote.voter_id == current_user.id 
				return false
			end
		end
		true
	end
end