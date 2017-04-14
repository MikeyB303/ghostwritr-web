module PostsHelper
  def published_posts(user, published = true)
    user.posts.where(published?: published)
  end

  def user_has_post(user)
  	!user.posts.empty?
  end
  
  def return_users_liked_post(user)
  	user.votes.where(votable_type: Post)
  end
end
